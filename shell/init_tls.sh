#!/usr/bin/env bash
installType='yum -y install'
removeType='yum -y remove'
upgrade="yum -y update"
echoType='echo -e'
cp=`which cp`
# Print
echoColor(){
    case $1 in
        # red
        "red")
            ${echoType} "\033[31m$2 \033[0m"
        ;;
        # sky blue
        "skyBlue")
            ${echoType} "\033[36m$2 \033[0m"
        ;;
        # green
        "green")
            ${echoType} "\033[32m$2 \033[0m"
        ;;
        # White
        "white")
            ${echoType} "\033[37m$2 \033[0m"
        ;;
        "magenta")
            ${echoType} "\033[31m$2 \033[0m"
        ;;
        "skyBlue")
            ${echoType} "\033[36m$2 \033[0m"
        ;;
        # yellow
        "yellow")
            ${echoType} "\033[33m$2 \033[0m"
        ;;
    esac
}
# Select the system execution tool
checkSystem(){

	if [[ ! -z `find /etc -name "redhat-release"` ]] || [[ ! -z `cat /proc/version | grep -i "centos" | grep -v grep ` ]] || [[ ! -z `cat /proc/version | grep -i "red hat" | grep -v grep ` ]] || [[ ! -z `cat /proc/version | grep -i "redhat" | grep -v grep ` ]]
	then
		release="centos"
		installType='yum -y install'
		removeType='yum -y remove'
		upgrade="yum update -y"
	elif [[ ! -z `cat /etc/issue | grep -i "debian" | grep -v grep` ]] || [[ ! -z `cat /proc/version | grep -i "debian" | grep -v grep` ]]
    then
		release="debian"
		installType='apt -y install'
		upgrade="apt update -y"
		removeType='apt -y autoremove'
	elif [[ ! -z `cat /etc/issue | grep -i "ubuntu" | grep -v grep` ]] || [[ ! -z `cat /proc/version | grep -i "ubuntu" | grep -v grep` ]]
	then
		release="ubuntu"
		installType='apt -y install'
		upgrade="apt update -y"
		removeType='apt --purge remove'
    fi
    if [[ -z ${release} ]]
    then
        echoContent red "This script does not support this system, please give feedback to the developer below"
        cat /etc/issue
        cat /proc/version
        exit 0;
    fi
}
# Installation tool package
installTools(){
    echoColor yellow "renew"
    ${upgrade}
    if [[ -z `find /usr/bin/ -executable -name "socat"` ]]
    then
        echoColor yellow "\nsocatNot Installed，installing\n"
        ${installType} socat >/dev/null
        echoColor green "SOCAT installation is complete"
    fi
    echoColor yellow "\n to detect whether nginx is installed"
    if [[ -z `find /sbin/ -executable -name 'nginx'` ]]
    then
        echoColor yellow "Nginx is not installed, installed in installation\n"
        ${installType} nginx >/dev/null
        echoColor green "nginx is installed"
    else
        echoColor green "Nginx has been installed\n"
    fi
    echoColor yellow "Detect whether to install ACME.sh"
    if [[ -z `find ~/.acme.sh/ -name "acme.sh"` ]]
    then
        echoColor yellow "\nacme.shNot Installed，installing\n"
        curl -s https://get.acme.sh | sh >/dev/null
        echoColor green "acme.sh installation\n"
    else
        echoColor green "acme.sh has been installed\n"
    fi

}
# Recovery configuration
resetNginxConfig(){
    `cp -Rrf /tmp/afandiazmi/nginx/nginx.conf /etc/nginx/nginx.conf`
    rm -rf /etc/nginx/conf.d/5NX2O9XQKP.conf
    echoColor green "\n recovery configuration is complete"
}
# Backup
bakConfig(){
    mkdir -p /tmp/afandiazmi/nginx
    `cp -Rrf /etc/nginx/nginx.conf /tmp/afandiazmi/nginx/nginx.conf`
}
# Installation certificate
installTLS(){
    echoColor yellow "Please enter the domain name [Example:blog.v2RayVPN.com】："
    read domain
    if [[ -z ${domain} ]]
    then
        echoColor red "Domain name is not filled in\n"
        installTLS
    fi
    # Backup
    bakConfig
    # Replace the domain name in the original file
    if [[ ! -z `cat /etc/nginx/nginx.conf|grep -v grep|grep "${domain}"` ]]
    then
        sed -i "s/${domain}/X655Y0M9UM9/g"  `grep "${domain}" -rl /etc/nginx/nginx.conf`
    fi

    touch /etc/nginx/conf.d/6GFV1ES52V2.conf
    echo "server {listen 80;server_name ${domain};root /usr/share/nginx/html;location ~ /.well-known {allow all;}location /test {return 200 '5NX2O9XQKP';}}" > /etc/nginx/conf.d/5NX2O9XQKP.conf
    nginxStatus=1;
    if [[ ! -z `ps -ef|grep -v grep|grep nginx` ]]
    then
        nginxStatus=2;
        ps -ef|grep -v grep|grep nginx|awk '{print $2}'|xargs kill -9
        sleep 0.5
        nginx
    else
        nginx
    fi
    echoColor yellow "\nVerify the domain name and server is available"
    if [[ ! -z `curl -s ${domain}/test|grep 5NX2O9XQKP` ]]
    then
        ps -ef|grep -v grep|grep nginx|awk '{print $2}'|xargs kill -9
        sleep 0.5
        echoColor green "Service available, generate in TLS, please wait\n"
    else
        echoColor red "If the service is not available, please detect whether the DNS configuration is correct"
        # Restore backup
        resetNginxConfig
        exit 0;
    fi
    sudo ~/.acme.sh/acme.sh --issue -d ${domain} --standalone -k ec-256 >/dev/null
    ~/.acme.sh/acme.sh --installcert -d ${domain} --fullchainpath /tmp/afandiazmi/nginx/${domain}.crt --keypath /tmp/afandiazmi/nginx/${domain}.key --ecc >/dev/null
    if [[ -z `cat /tmp/afandiazmi/nginx/${domain}.key` ]]
    then
        echoColor red "Certificate Key failed, please reorganize"
        resetNginxConfig
        exit
    elif [[ -z `cat /tmp/afandiazmi/nginx/${domain}.crt` ]]
    then
        echoColor red "Certificate CRT generating failure, please reorganize "
        resetNginxConfig
        exit
    fi
    echoColor green "Successful certificate"
    echoColor green "证书目录/tmp/afandiazmi/nginx"
    ls /tmp/afandiazmi/nginx

    resetNginxConfig
    if [[ ${nginxStatus} = 2  ]]
    then
        nginx
    fi
}

init(){
    echoColor red "\n=============================="
Echocolor YELLOW "Precautions for this script"
    Echocolor Green "1. Will install dependencies and dependencies"
    Echocolor Green "2. Backing nginx configuration files"
    Echocolor Green "3. Will install nginx and acme.sh. If it is installed, use the existing existence"
    Echocolor Green "4. After installation or failure, it will automatically restore backup, please do not turn off the script manually"
    echocolor Green "5. Please do not restart the machine during execution"
    Echocolor Green "6. Backup files and certificates files are under/TMP, please pay attention to retain"
    Echocolor Green "7. If it is executed multiple times, it will be forced to cover the backup and generated certificate of the last time"
    Echocolor Green "8. Certificate default EC-256"
    echocolor Green "9. The next version will be added with a formal symbol certificate to generate [TODO]"
    Echocolor Green "10. You can generate a certificate of multiple different domain names [including sub-domain name], please check [https://letsencrypt.org/zh-cn/docs/raate-limits/]"
    Echocolor Green "11. Compatible with CentOS, Ubuntu, Debian"
    echoColor green "   12.Github[https://github.com/afandiazmi]"
    echoColor red "=============================="
Echocolor yellow "Please enter the [y] execution script, [arbitrary] end:"    read isExecStatus
    if [[ ${isExecStatus} = "y" ]]
    then
        installTools
        installTLS
    else
        echoColor green "Welcome to use next time"
        exit
    fi
}
checkSystem
init

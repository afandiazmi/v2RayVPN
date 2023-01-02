#!/usr/bin/env bash
num=5
ip=()
timeout=1000
echoType='echo -e'
trap 'onCtrlC' INT
function onCtrlC () {
    statisticalContent
    exit;
}
# calculate
statisticalContent(){
    if [[ ! -z `ls /tmp|grep -v grep|grep ping.log` ]]
    then
        echoContent red "============================================="
        echoContent yellow 'Calculate--->'
        # Sort calculation
        echoContent red "Sorting Rules: Package Return rate> Volatility> Average delay, only show the best of the best"
        echocontent red "shows: [The minimum delay of the IP packet loss rate average delay maximum delay volatility]"
        cat /tmp/ping.log|sort -t ' ' -k 2n -k 6n -k 4n|head -30
        echoContent red "============================================="
    fi

}
# Echo tool class
echoContent(){
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
# test
pingTool(){
    echo ''>/tmp/ping.log
    echoContent red "============================================="
    echoContent green "The default test is five times, and the timeout is 1000ms ""
    echoContent red "============================================="
    read -p "Please enter a single IP test number [default 5 times】：" testNum
    if [[ "$testNum" =~ ^[0-9]+$ ]]
    then
        num=${testNum}
    else
        echoContent red 'Use the default'
    fi
    echoContent yellow "一common${#ip[*]}This IP, Test $ {num} per IP, takes about time -consuming`expr ${#ip[*]} \* ${num} / 60`分钟"
    echoContent yellow "You can ctrl+c midway, so that only the calculation and statistics have been recorded"
    for ((i=0;i<${#ip[*]};i++))
    do
        if [[ -z ${ip[$i]} ]]
        then
            continue;
        fi
        pingResult=`ping -c ${num} -W ${timeout} ${ip[$i]}`
        packetLoss=`echo ${pingResult}|awk -F "[%]" '{print $1}'|awk -F "[p][a][c][k][e][t][s][ ][r][e][c][e][i][v][e][d][,][ ]" '{print $2}'`
        roundTrip=`echo ${pingResult}|awk -F "[r][o][u][n][d][-][t][r][i][p]" '{print $2}'|awk '{print $3}'|awk -F "[/]" '{print $1"."$2"."$3"."$4}'|awk -F "[/]" '{print $1$2$3$4}'|awk -F "[.]" '{print $1" "$3" "$5" "$7}'`
        if [[ "${release}" = "ubuntu" ]] || [[ "${release}" = "debian" ]] || [[ "${release}" = "centos" ]]
        then
            packetLoss=`echo ${pingResult}|awk -F "[%]" '{print $1}'|awk -F "[r][e][c][e][i][v][e][d][,][ ]" '{print $2}'`
            roundTrip=`echo ${pingResult}|awk -F "[r][t][t]" '{print $2}'|awk '{print $3}'|awk -F "[/]" '{print $1"."$2"."$3"."$4}'|awk -F "[/]" '{print $1$2$3$4}'|awk -F "[.]" '{print $1" "$3" "$5" "$7}'`
        fi

        ## |awk -F "[/]" '{print $1$2$3}'|awk -F "[.]" '{print $1" "$3" "$5" "$7}'
        if [[ -z ${roundTrip} ]]
        then
            roundTrip="none"
        fi
        echo "ip:${ip[$i]},Packet loss rate:${packetLoss}%,Minimum/average/maximum/fluctuation:${roundTrip}"
        echo "${ip[$i]} ${packetLoss} ${roundTrip}" >> /tmp/ping.log
    done
    statisticalContent
}
# Find the country and region
findCountry(){
    if [[ -z  `ls /tmp|grep -v grep|grep ips` ]]
    then
        echoContent red "Lack of IP library, please contact the author。"
        exit 0;
    fi
    echoContent red "============================================="
    cat /tmp/ips|awk -F "[|]" '{print $1}'|awk  -F "[-]" '{print $3}'|uniq|awk '{print NR":"$0}'
    echoContent red "============================================="
    read -p "Enter the above numbers: " selectType
    if [[ -z `cat /tmp/ips|awk -F "[|]" '{print $1}'|awk  -F "[-]" '{print $3}'|uniq|awk '{print NR":"$0}'|grep -v grep|grep ${selectType}` ]]
    then
        echoContent red 'Input is wrong, please re -enter'
        findCountry
    fi
    findIPList ${selectType}
}
# Find IP
findIPList(){
    country=`cat /tmp/ips|awk -F "[|]" '{print $1}'|awk  -F "[-]" '{print $3}'|uniq|awk '{print NR":"$0}'|grep -v grep|grep ${selectType}|sort -t ':' -k 1n|head -1|awk -F "[:]" '{print $2}'`
    # cat /tmp/ips|awk -F "[|]" '{print $1}'|awk  -F "[-]" '{print $3}'|uniq|awk '{print NR":"$0}'|grep -v grep|grep 1|sort -t ':' -k 1n|head -1|awk -F "[:]" '{print $2}'
    echoContent red "============================================="
    cat /tmp/ips|grep -v grep|grep ${country}|awk -F "[|]" '{print $1}'|awk -F "[-]" '{print $1"-"$2}'|awk '{print "["NR"]"":"$0}'
    read -p "Please enter the above number to test the corresponding IP segment:" selectType
    if [[ -z ${selectType} ]]
    then
        echoContent red 'Input is wrong, please re -enter！'
        findIPList $1
    fi
    echo ${country}
    # cat /tmp/ips|grep -v grep|grep China Mobile|awk -F "[|]" '{print NR"-"$2}'|grep 174-|head -1 |awk -F "[|]" '{print $2}'
    eval $(cat /tmp/ips|grep -v grep|grep ${country}|awk -F "[|]" '{print NR"-"$2}'|grep ${selectType}-|head -1|awk -F "[-]" '{print $2}'|awk '{split($0,serverNameList," ");for(i in serverNameList) print "ip["i"]="serverNameList[i]}')
    pingTool
}
# Inspection system
checkSystem(){
    if [[ "`uname`" = "Darwin" ]]
	then
	    release="Darwin"
	elif [[ ! -z `find /etc -name "redhat-release"` ]] || [[ ! -z `cat /proc/version | grep -i "centos" | grep -v grep ` ]] || [[ ! -z `cat /proc/version | grep -i "red hat" | grep -v grep ` ]] || [[ ! -z `cat /proc/version | grep -i "redhat" | grep -v grep ` ]]
    then
        release="centos"
	elif [[ ! -z `cat /etc/issue | grep -i "ubuntu" | grep -v grep` ]] || [[ ! -z `cat /proc/version | grep -i "ubuntu" | grep -v grep` ]]
	then
		release="ubuntu"
    elif [[ ! -z `cat /etc/issue | grep -i "debian" | grep -v grep` ]] || [[ ! -z `cat /proc/version | grep -i "debian" | grep -v grep` ]]
	then
		release="debian"
    fi
    if [[ -z ${release} ]]
    then
        echoContent red "This script does not support this system, please give feedback to the developer below"
        cat /etc/issue
        cat /proc/version
        killSleep > /dev/null 2>&1
        exit 0;
    fi
}
# 下载ip库
downloadIPs(){
    if [[ -z `ls /tmp|grep -v grep|grep ips` ]]
    then
        echoContent yellow 'Start downloading IP library'
        wget -q -P /tmp/ https://raw.githubusercontent.com/afandiazmi/v2RayVPN/main/fodder/ips/ips
        echoContent yellow 'Ending'
    fi
}
downloadIPs
checkSystem
findCountry


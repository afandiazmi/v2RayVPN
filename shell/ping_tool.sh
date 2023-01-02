#!/usr/bin/env bash
purple="\033[35m"
skyBlue="\033[36m"
red="\033[31m"
green="\033[32m"
yellow="\e[93m"
magenta="\e[95m"
cyan="\e[96m"
none="\033[0m"
# Connect 104.23.240.0-104.23.243.254
# Northern Unicom Faster node
# 152ms--- 104.23.240.45 104.23.241.132 104.23.242.84 104.23.243.9

# move 104.16.0.0-79.255 104.16.96.0-175.254 104.16.192.0-207.255
ChinaUnicom=("104.23.240.0-104.23.243.254")
ChinaMobile=("1.0.0.0-1.0.0.254" "1.1.1.0-1.1.1.254" "104.16.80.0-104.16.95.255" "104.16.175.255-104.16.191.255")
hkDirect=("104.16.0.0-104.16.79.255" "104.16.96.0-104.16.175.254" "104.16.192.0-104.16.207.255")


# Test delay
testPing(){
echo "\n"${skyBlue}First$5 tests....${none}${red}Please wait${none}"\n"
# Calculate IP section
ip11=`echo $1|awk '{print $1}'`
ip12=`echo $1|awk '{print $2}'`
ip21=`echo $2|awk '{print $1}'`
ip22=`echo $2|awk '{print $2}'`
ip31=`echo $3|awk '{print $1}'`
ip32=`echo $3|awk '{print $2}'`
ip41=`echo $4|awk '{print $1}'`
ip42=`echo $4|awk '{print $2}'`
index=0
for ((i1=$ip11;i1<=$ip12;i1++))
do
    for ((i2=$ip21;i2<=$ip22;i2++))
    do
        for ((i3=$ip31;i3<=$ip32;i3++))
        do
            for ((i4=$ip41;i4<=$ip42;i4++))
            do
                ip="${i1}.${i2}.${i3}.${i4}"
                status=`ping -c 1 -W 1000 "${ip}"|awk '{print $7}'|awk 'BEGIN{FS="="} {print $2}'|awk 'BEGIN{FS="."} {print $1}'`
                ipArr[$index]="${ip} ${status} ms"

                if [ "${ipArr[$index]}" == "${ip}  ms" ]
                then
                    ipArr[$index]="${ip} 9999  ms"
                fi
                echo ${skyBlue}".\c"{none}
#                echo ${skyBlue}${ipArr[$index]}${none}
                let "index++"
            done
        done
    done
done
echo ${skyBlue}"Please wait"${none}
min="1.1.1.1 1000 ms"
indexLength=${#ipArr[@]}
index=0
while(( $index< $indexLength))
do
    latency=`echo ${ipArr[$index]}|awk '{print $2}'`
    latency2=`echo $min|awk '{print $2}'`

    if [[ ! -z $latency && ! -z $latency2 ]]
    then
        if [ $latency -lt $latency2 ]
        then
            min="${ipArr[$index]}"
        fi
    else
        echo 'abnormal data'
    fi
    let "index++"
done
echo "${skyBlue}\n detected a total of $ {indexlength} a IP, No. 1$The optimal IP of the 5 -stage IP interval is:${none}"${green}$min${none}
}
manageFun(){
    case $1 in
        1)
            echo ${skyBlue}"The IP segment to be detected is: 104.23.240.0-104.23.243.254"${none}
            ipList=()
            for ((i=0;i<${#ChinaUnicom[*]};i++))
            do
                ip01=`echo ${ChinaUnicom[$i]}|awk -F "[-]" '{print $1}'`
                ip02=`echo ${ChinaUnicom[$i]}|awk -F "[-]" '{print $2}'`
                ip11=`echo $ip01|awk -F "[.]" '{print $1}'`
                ip12=`echo $ip02|awk -F "[.]" '{print $1}'`

                ip21=`echo $ip01|awk -F "[.]" '{print $2}'`
                ip22=`echo $ip02|awk -F "[.]" '{print $2}'`
                ip31=`echo $ip01|awk -F "[.]" '{print $3}'`
                ip32=`echo $ip02|awk -F "[.]" '{print $3}'`
                ip41=`echo $ip01|awk -F "[.]" '{print $4}'`
                ip42=`echo $ip02|awk -F "[.]" '{print $4}'`

                index=$i
                let "index++"
                testPing "$ip11 $ip12" "$ip21 $ip22" "$ip31 $ip32" "$ip41 $ip42" $index
            done
        ;;
        2)
            echo ${skyBlue}"The IP segment to be detected is: 1.0.0.0-1.0.0.254，1.1.1.0-1.1.1.254，104.16.80.0-104.16.95.255，104.16.175.255-104.16.191.255"${none}
            for ((i=0;i<${#ChinaMobile[*]};i++))
            do
                ip01=`echo ${ChinaMobile[$i]}|awk -F "[-]" '{print $1}'`
                ip02=`echo ${ChinaMobile[$i]}|awk -F "[-]" '{print $2}'`
                ip11=`echo $ip01|awk -F "[.]" '{print $1}'`
                ip12=`echo $ip02|awk -F "[.]" '{print $1}'`

                ip21=`echo $ip01|awk -F "[.]" '{print $2}'`
                ip22=`echo $ip02|awk -F "[.]" '{print $2}'`
                ip31=`echo $ip01|awk -F "[.]" '{print $3}'`
                ip32=`echo $ip02|awk -F "[.]" '{print $3}'`
                ip41=`echo $ip01|awk -F "[.]" '{print $4}'`
                ip42=`echo $ip02|awk -F "[.]" '{print $4}'`
                index=$i
                let "index++"
                testPing "$ip11 $ip12" "$ip21 $ip22" "$ip31 $ip32" "$ip41 $ip42" ${index}
            done
        ;;
        3)
            echo ${skyBlue}"The IP segment to be detected is: 104.16.0.0-104.16.79.255，104.16.96.0-104.16.175.254，104.16.192.0-104.16.207.255"${none}
            for ((i=0;i<${#hkDirect[*]};i++))
            do
                ip01=`echo ${hkDirect[$i]}|awk -F "[-]" '{print $1}'`
                ip02=`echo ${hkDirect[$i]}|awk -F "[-]" '{print $2}'`
                ip11=`echo $ip01|awk -F "[.]" '{print $1}'`
                ip12=`echo $ip02|awk -F "[.]" '{print $1}'`

                ip21=`echo $ip01|awk -F "[.]" '{print $2}'`
                ip22=`echo $ip02|awk -F "[.]" '{print $2}'`
                ip31=`echo $ip01|awk -F "[.]" '{print $3}'`
                ip32=`echo $ip02|awk -F "[.]" '{print $3}'`
                ip41=`echo $ip01|awk -F "[.]" '{print $4}'`
                ip42=`echo $ip02|awk -F "[.]" '{print $4}'`
                index=$i
                let "index++"
                testPing "$ip11 $ip12" "$ip21 $ip22" "$ip31 $ip32" "$ip41 $ip42" ${index}
            done
        ;;
    esac
}
start(){
    echo "${purple}Test the specified IP segment, Cloudflare's IP delay${none}"
    echo "${purple}===============================${none}"
    echo "${green}  1.Connect${none}"
    echo "${green}  2.move${none}"
    echo "${green}  3.HK direct connection [suitable for mobile and server in HK]${none}"
    echo "${purple}===============================${none}"
    echo "${skyBlue}Please select [Digital Number]:${none}"
    read -e funType
    manageFun $funType
}
start
# 104.23.240.0-104.23.243.254
#testPing "104 104" "23 23" "243 243" "0 100"

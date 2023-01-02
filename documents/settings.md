---

- [1. Startup at boot](#1 Startup at boot)
  - [1. Configure Nginx to start automatically at boot](#1 Configure Nginx to start automatically at boot)
  - [2. Configure v2ray_ws_tls to start automatically at boot](#2 Configure v2ray_ws_tls to start at boot)
  - [3. Test whether the auto-boot is successful] (#3 test whether the auto-start is successful)
- [2. Enable Centos bbr congestion control algorithm [my test machine is centos 7]] (#27 enable centos-bbr congestion control algorithm and my test machine is centos-7)
  - [1. Check if bbr is installed](#1 check if bbr is installed)
  - [2.yum update](#2yum update)
  - [3. View system version](#3 View system version)
  - [4. Install elrepo and upgrade the kernel](#4 Install elrepo and upgrade the kernel)
  - [5. Update the grud file and restart](#5 Update the grud file and restart)
  - [6. Check whether the content is 4.9 and above after booting] (#6 Check whether the content is 4.9 and above after booting)
  - [7. Open bbr] (#7 open bbr)
  - [8. Verify that bbr is successfully opened] (#8 Verify that bbr is successfully opened)
    - [Test method 1](#Test method 1)
    - [Test method 2](#Test method 2)

---

# 1. Boot up automatically

## 1. Configure Nginx to start automatically at boot

- create service file

```
cd /etc/systemd/system&&touch nginxReboot.service
```

- Copy the following content to /etc/systemd/system/nginxReboot.service

```
[Unit]
Description=nginx - high performance web server
After=network.target remote-fs.target nss-lookup.target

[Service]
Type=forking
PIDFile=/run/nginx.pid
Environment=PATH=/root/.nvm/versions/node/v12.8.1/bin:/usr/bin/v2ray/:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/ bin:/root/bin:/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin
ExecStartPre=/usr/sbin/nginx -t -c /etc/nginx/nginx.conf
ExecStart=/usr/sbin/nginx -c /etc/nginx/nginx.conf
ExecReload=/usr/sbin/nginx -s reload
ExecStop=/usr/sbin/nginx -s stop
ExecQuit=/usr/sbin/nginx -s quit
PrivateTmp=true

[Install]
WantedBy=multi-user.target
```

- Set up to start automatically

```
sudo systemctl enable nginxReboot.service
```

- possible errors

```
# May appear (13: Permission denied) while connecting to upstream:[nginx]
// Solution Execute the following command
setsebool -P httpd_can_network_connect 1
```

## 2. Configure v2ray_ws_tls to start automatically

- create service file

```
cd /etc/systemd/system&&touch v2ray_ws_tls.service
```

- Copy the following content to /etc/systemd/system/v2ray_ws_tls.service

```
[Unit]
Description=V2Ray WS TLS Service
After=network.target
Wants=network.target

[Service]
Type=simple
PIDFile=/run/v2rayWSTLS.pid
ExecStart=/usr/bin/v2ray/v2ray-config /root/config_ws_tls.json
Restart=on-failure
# Don't restart in the case of configuration error
RestartPreventExitStatus=23

[Install]
WantedBy=multi-user.target
```

- Set up to start automatically

```
sudo systemctl enable v2ray_ws_tls.service
```

## 3. Test whether the startup is successful

- restart vps

```
reboot
```

- After restarting, check whether the program starts normally

```
# Execute the following command to check whether v2ray is started
ps -ef|grep v2ray

root 4533 1 0 03:03 ? 00:00:00 /usr/bin/v2ray/v2ray-config /root/config_ws_tls.json
root 4560 1287 0 03:04 pts/0 00:00:00 grep --color=auto v2ray

# Execute the following command to check whether nginx is started,
ps -ef|grep nginx
``
root 762 1 0 02:20 ? 00:00:00 nginx: master process /usr/sbin/nginx -c /etc/nginx/nginx.conf
nginx 763 762 0 02:20 ? 00:00:00 nginx: worker process
root 4562 1287 0 03:04 pts/0 00:00:00 grep --color=auto nginx
```

# 2. Turn on the Centos bbr congestion control algorithm [my test machine is centos 7]

## 1. Check if bbr is installed

- Some vps will have their own bbr module, such as some machines of bricklayers, execute the following command

```
lsmod | grep bbr
```

- If the output is similar, bbr has already been turned on, and it can end here

```
tcp_bbr 20480 28
```

## 2.yum update

```
yum update
```

## 3. Check the system version

- Execute the following command

```
cat /etc/redhat-release
```

- If the number behind the release is greater than 7.3

```
CentOS Linux release 7.7.1908 (Core)
```

## 4. Install elrepo and upgrade the kernel

- Execute the following commands in sequence

```
rpm --import https://www.elrepo.org/RPM-GPG-KEY-elrepo.org
rpm -Uvh http://www.elrepo.org/elrepo-release-7.0-2.el7.elrepo.noarch.rpm
yum --enablerepo=elrepo-kernel install kernel-ml -y
```

- Under normal circumstances, the following content will be output

```
Transaction Summary
==================================================== ================================
Install 1 Package
Total download size: 39 M
Installed size: 169M
Downloading packages:
kernel-ml-4.9.0-1.el7.elrepo.x86_64.rpm | 39 MB 00:00
Running transaction check
Running transaction test
Transaction test succeeded
running transaction
Warning: RPMDB altered outside of yum.
   Installing: kernel-ml-4.9.0-1.el7.elrepo.x86_64 1/1
   Verifying: kernel-ml-4.9.0-1.el7.elrepo.x86_64 1/1
Installed:
   kernel-ml.x86_64 0:4.9.0-1.el7.elrepo
Complete!
```

## 5. Update the grud file and restart

- Execute the following commands in sequence, and wait for a few seconds to re-use the ssh connection after restarting

```
egrep ^menuentry /etc/grub2.cfg | cut -f 2 -d \'
grub2-set-default 0
reboot
```

## 6. Check whether the content is 4.9 or above after booting

- Execute the command below

```
uname -r
```

- output result

```
5.3.7-1.el7.elrepo.x86_64
```

## 7. Open bbr

- Execute the command below

```
vim /etc/sysctl.conf
```

- Add the following content

```
net.core.default_qdisc = fq
net.ipv4.tcp_congestion_control = bbr
```

- Load system parameters

```
sysctl -p
```

## 8. Verify that bbr is enabled successfully

### Test Method 1

- Execute the command below

```
sysctl net.ipv4.tcp_available_congestion_control
```

- Output the following content is successful

```
net.ipv4.tcp_available_congestion_control = bbr cubic reno
```

### Test Method 2

- Execute the command below

```
lsmod | grep bbr
```

- Output the following content is successful

```
tcp_bbr 20480 28
```

# Table of contents

- [Skill Point List](#Skill Point List)
- [One-key script](#One-key script)
  - [1. Auto Mode] (#1 Auto Mode)
  - [2. Manual Mode](#2 Manual Mode)
- [1. Preparations] (#1 Preparations)
  - [1. Register cloudflare] (#1 register cloudflare)
  - [2. Register godaddy and purchase a domain name](#2 Register godaddy and purchase a domain name)
  - [3. Modify the DNS resolution of the godaddy domain name](#3 Modify the dns resolution of the godaddy domain name)
    - [1. Log in to cloudflare, add a domain name] (#1 log in to cloudflare to add a domain name)
    - [2. Select package] (#2 Select package)
    - [3. Modify godaddy's dns analysis according to the prompt](#3 Modify godaddy's dns analysis according to the prompt)
  - [4. Add cloudflare domain name resolution] (#4 increase cloudflare domain name resolution)
  - [5. Modify godaddy SSL/TLS](#5 modify godaddy-ssltls)
- [2.vps configure Nginx, https](#2vps configure nginxhttps)
  - [1. Install Nginx] (#1 Install Nginx)
  - [2.nginx configuration file](#2nginx configuration file)
  - [3. generate https] (#3 generate https)
- [3. Configure v2ray] (#3 configure v2ray)
  - [1. Install v2ray] (#1 install v2ray)
  - [2.v2ray configuration file](#v2ray configuration file)
  - [3. Start v2ray] (#3 start v2ray)
- [4.client](#4client)
  - [1.MacOS](#1macos)
  - [2.windows](#2windows)

# 1. Preparation

## 1. Register [cloudflare](cloudflare.com)

## 2. Register [godaddy](https://www.godaddy.com/) and purchase a domain name or use a free domain name [freenom](https://freenom.com/)

- Here use godaddy as an example
- The domain name can choose an international domain name ending in xyz, which can be combined with multi-character garbled characters (such as wk1c.xyz). The first year is about 8RMB, and a new one can be bought directly in the second year.

## 3. Modify the DNS resolution of the godaddy domain name

### 1. Log in to cloudflare and add a domain name

<img src="https://raw.githubusercontent.com/afandiazmi/v2RayVPN/main/fodder/cloudflare.png" width=400>

### 2. Select package

- If you only enjoy the scientific Internet access function, just choose free
- If you need a better network environment and faster speed, you can choose the corresponding package
  <img src="https://raw.githubusercontent.com/afandiazmi/v2RayVPN/main/fodder/cloudflare_plan.png" width=400>

### 3. Modify the dns resolution of godaddy according to the prompt

- cloudflare prompt interface
  <img src="https://raw.githubusercontent.com/afandiazmi/v2RayVPN/main/fodder/cloudflare_dns.png" width=400>

- Godaddy DNS management, according to the above cloudflare prompt interface, modify it to the corresponding dns
  <img src="https://raw.githubusercontent.com/afandiazmi/v2RayVPN/main/fodder/godayddy_dns.png" width=400>

## 4. Add cloudflare domain name resolution

- Add domain name resolution (record), you can choose the second-level domain name, so that you can resolve to different servers a month, name fills in the host part of the second-level domain name you want to resolve, for example, just fill in ls for ls.example.com
  <img src="https://raw.githubusercontent.com/afandiazmi/v2RayVPN/main/fodder/cloudflare_record_dns.png" width=400>

## 5. Modify godaddy SSL/TLS

- If the vps chooses to use https, you need to change the type to Full
  <img src="https://raw.githubusercontent.com/afandiazmi/v2RayVPN/main/fodder/cloudflare_tls.png" width=400>

# 2.vps configure Nginx, https

## 1. Install Nginx

```
yum install nginx
```

## 2. nginx configuration file

- 1. Download the configuration file and replace the default file

```
cd /etc/nginx&&rm -rf /etc/nginx/nginx.conf&&wget https://raw.githubusercontent.com/afandiazmi/v2RayVPN/main/config/nginx.conf
# If wget is missing, execute the following command, then repeat the above command
yum install wget
```

- Replace all the content about ls.xxx.xyz in the downloaded file with your second-level domain name

## 3. Generate https

- 1. Install acme.sh

```
curl https://get.acme.sh | sh
% Total % Received % Xferd Average Speed Time Time Time Current
                                Dload Upload Total Spent Left Speed
100 671 100 671 0 0 680 0 --:--:-- --:--:-- --:--:-- 679
% Total % Received % Xferd Average Speed Time Time Time Current
                                Dload Upload Total Spent Left Speed
100 112k 100 112k 0 0 690k 0 --:--:-- --:--:-- --:--:-- 693k
[Fri 30 Dec 01:03:32 GMT 2016] Installing from online archive.
[Fri 30 Dec 01:03:32 GMT 2016] Downloading https://github.com/Neilpang/acme.sh/archive/master.tar.gz
[Fri 30 Dec 01:03:33 GMT 2016] Extracting master.tar.gz
[Fri 30 Dec 01:03:33 GMT 2016] Installing to /home/user/.acme.sh
[Fri 30 Dec 01:03:33 GMT 2016] Installed to /home/user/.acme.sh/acme.sh
[Fri 30 Dec 01:03:33 GMT 2016] Installing alias to '/home/user/.profile'
[Fri 30 Dec 01:03:33 GMT 2016] OK, Close and reopen your terminal to start using acme.sh
[Fri 30 Dec 01:03:33 GMT 2016] Installing cron job
no crontab for user
no crontab for user
[Fri 30 Dec 01:03:33 GMT 2016] Good, bash is found, so change the shebang to use bash as preferred.
[Fri 30 Dec 01:03:33 GMT 2016] OK
[Fri 30 Dec 01:03:33 GMT 2016] Install success!
```

- 2. Generate https certificate

```
# Replace ls.xxx.xyz with your own domain name
sudo ~/.acme.sh/acme.sh --issue -d ls.xxx.xyz --standalone -k ec-256

# If prompted Please install socat tools first. Execute, continue to repeat the above command after the installation is complete
yum install socat
```

- 3. Install the certificate

```
# Replace ls.xxx.xyz with your own domain name
~/.acme.sh/acme.sh --installcert -d ls.xxx.xyz --fullchainpath /etc/nginx/ls.xxx.xyz.crt --keypath /etc/nginx/ls.xxx.xyz.key --ecc
```

- 4. Modify /etc/nginx/nginx.conf

```
# Remove the # in front of the following part, and modify ssl_certificate and ssl_certificate_key to your own path

# listen 443 ssl;
# ssl_certificate /etc/nginx/ls.xx.xyz.crt;
# ssl_certificate_key /etc/nginx/ls.xx.xyz.key;
# server_name ls.xx.xyz
```

- 5. The validity period of each https certificate is only three months after it is generated, and it needs to be updated when it is about to expire (it can be regenerated within the remaining seven days)

```
# Replace ls.xxx.xyz with your own domain name
sudo ~/.acme.sh/acme.sh --renew -d ls.xxx.xyz --force --ecc
```

# 3. Configure v2ray

## 1. Install v2ray

```
bash <(curl -L -s https://install.direct/go.sh)
```

## 2. v2ray configuration file

- Download config_ws_tls.json

```
cd && wget https://raw.githubusercontent.com/afandiazmi/v2RayVPN/main/config/config_ws_tls.json
```

- The id of the configuration file can generate a new one by itself, just replace it

```
/usr/bin/v2ray/v2ctl uuid
```

## 3. Start v2ray

```
/usr/bin/v2ray/v2ray-config ./config_ws_tls.json&
```

# 4. Client

## 1. MacOS

- Download V2RayU[click me to download](https://github.com/yanue/V2rayU/releases/download/1.4.1/V2rayU.dmg)
- After downloading, open it, set the server, and modify the address
  <img src="https://raw.githubusercontent.c

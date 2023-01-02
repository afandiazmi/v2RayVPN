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
- [2.vps configure Nginx](#2vps configure nginx)
  - [1. Install Nginx] (#1 Install Nginx)
  - [2.nginx configuration file](#2nginx configuration file)
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

- If the vps chooses to use https, you need to change the type to Flexible
  <img src="https://raw.githubusercontent.com/afandiazmi/v2RayVPN/main/fodder/cloudflare_tls_Flexible.png" width=400>

# 2.vps configure Nginx

## 1. Install Nginx

```
yum install nginx
```

## 2. nginx configuration file

- 1. Download the configuration file and replace the default file

```
cd /etc/nginx&&rm -rf /etc/nginx/nginx.conf&&wget https://raw.githubusercontent.com/afandiazmi/v2RayVPN/main/config/nginx_Flexible.conf&&mv /etc/nginx/nginx_Flexible.conf /etc/nginx/nginx .conf
# If wget is missing, execute the following command, then repeat the above command
yum install wget
```

- Replace all the content about ls.xxx.xyz in the downloaded file with your second-level domain name

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
  <img src="https://raw.githubusercontent.com/afandiazmi/v2RayVPN/main/fodder/v2rayU_server configuration.png" width=400>

- pac settings, add the link below and choose to use Pac mode, you can

```
https://raw.githubusercontent.com/gfwlist/gfwlist/master/gfwlist.txt
```

## 2. windows

- Download v2rayN[click me to download](https://github.com/2dust/v2rayN/releases/download/2.44/v2rayN.zip)
- How to use [Click me to view](https://github.com/233boy/v2ray/wiki/V2RayN%E4%BD%BF%E7%94%A8%E6%95%99%E7%A8%8B)

## 3.Android

- [v2rayNG](https://github.com/2dust/v2rayNG/releases)

## 4.ios [Need to purchase by yourself or use a shared account to install]

- Quantumult [recommended use]
  -Shadowrocket

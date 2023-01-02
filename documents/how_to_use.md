> Script Function Introduction

# Table of contents

- [1. Quick Start] (#1 Quick Start)
- [2. Advanced Tutorial](#2 Advanced Tutorial)
- [3. Common Error Handling] (#3 Common Error Handling)
- [4. Q&A](#4 Q&A)

# 1. Quick start

## 1. Install/reinstall/install in any combination

- install/reinstall

This operation will install the installation of all protocols according to the selection of different kernels [VLESS, VMess, trojan]

- Install in any combination

Mandatory VLESS TCP, the rest can be combined arbitrarily

### 1. Select the kernel

-Xray-core
-v2ray-core

This version does not support xtls

-v2ray-core[XTLS]

The last v2ray-core version that supports xtls

<img src="https://raw.githubusercontent.com/afandiazmi/v2RayVPN/main/fodder/how_to_use/01.png" width=700>

### 2. Detect the IP of the domain name

Here, IPv4 will be detected first and then IPv6 will be detected

<img src="https://raw.githubusercontent.com/afandiazmi/v2RayVPN/main/fodder/how_to_use/02.png" width=700>

### 3. Apply for a TLS certificate

1. The certificate issued for the first time will be issued automatically. 2. If you have used acme.sh to apply for a certificate, it will be used directly and will not be reissued. If you select y in [Whether to reinstall], the certificate will be reinstalled instead of reissued.

<img src="https://raw.githubusercontent.com/afandiazmi/v2RayVPN/main/fodder/how_to_use/03.png" width=700>

### 4. Generate a random path

Here, the path of the last installation will be read first, and if it is not read, it will be manually entered or a random path

<img src="https://raw.githubusercontent.com/afandiazmi/v2RayVPN/main/fodder/how_to_use/04.png" width=700>

### 5. Install Xray/v2ray

Install according to the selected kernel, if it has been installed, it will prompt whether to update or upgrade

<img src="https://raw.githubusercontent.com/afandiazmi/v2RayVPN/main/fodder/how_to_use/05.png" width=700>

### 6. Install Trojan-Go

If you choose to install the trojan protocol or install all of them during installation, the trojan-go core will be automatically installed here, which is the same as above. If you have installed it, you will be prompted whether to update or upgrade.

<img src="https://raw.githubusercontent.com/afandiazmi/v2RayVPN/main/fodder/how_to_use/06.png" width=700>

### 7. Add smart DNS smart resolution

If you choose y, address is the preferred domain name resolution when viewing the account, and it will appear that address is the domain name provided by the script, and the fake domain name or SNI or peer is the personal domain name. For details, please refer to [this article](https ://github.com/afandiazmi/v2RayVPN/blob/main/documents/optimize_V2Ray.md), only supports ws transmission mode

<img src="https://raw.githubusercontent.com/afandiazmi/v2RayVPN/main/fodder/how_to_use/07.png" width=700>

### 8. Initialize the xray/v2ray configuration file

The entry of custom uuid will be provided here. If no custom uuid is provided, it will try to read the uuid of the last installation. If none of the above is read, it will randomly generate uuid.

<img src="https://raw.githubusercontent.com/afandiazmi/v2RayVPN/main/fodder/how_to_use/08.png" width=700>

### 9. Timed task maintenance certificate

The validity of the certificate will be checked at 1:30 every morning, and if it is invalid, it will be automatically updated, installed, and restarted.

### 10. Add a fake site

It will detect whether a fake site was installed last time. If it is not detected, it will automatically install the default fake site. If you are not satisfied with the follow-up, you can use the fake site provided by the script to replace or customize the fake site

<img src="https://raw.githubusercontent.com/afandiazmi/v2RayVPN/main/fodder/how_to_use/08.png" width=700>

### 11. Done

Congratulations! This is the last step. Next, we will check whether the service is normal. If it is normal, the account number will be displayed.

# 2. Advanced Teaching

## 1. Account Management

### 1. View Subscriptions

When [View Subscription], the script will automatically create a unique subscription address, and it will not be automatically generated when [View Subscription] is not. Every time the account is changed, it is necessary to re-【View Subscription】to generate new content. This operation is completely stored on your server, so you don't need to worry about leaks.

### 2. Add user/delete user

The script supports multi-user management. If a user is added, the corresponding subscription will generate multiple

<img src="https://raw.githubusercontent.com/afandiazmi/v2RayVPN/main/fodder/how_to_use/11.png" width=700>

### 3. Replace the fake site

The script provides multiple pseudo-sites that can be replaced

<img src="https://raw.githubusercontent.com/afandiazmi/v2RayVPN/main/fodder/how_to_use/10.png" width=700>

### 4. Modify the CDN node

The script provides multiple CNAMEs of preferred IPs, which can be replaced according to your local operator. For details, please refer to [this article](https://github.com/afandiazmi/v2RayVPN/blob/main/documents/optimize_V2Ray.md), only supports ws transmission mode

### 5. IPv6 offload

You can specify that the website only uses IPv6, application scenarios [1. Google human-machine verification 2. Streaming media unlocking]

### 6. Streaming media tools

- Netflix detection, to detect whether the vps supports Netflix unblocking, the built-in script may not be accurate.
- Any door floor machine to unlock Netflix

[Please check this article for details](https://github.com/afandiazmi/v2RayVPN/blob/main/documents/netflix/dokodemo-unblock_netflix.md)

<img src="https://raw.githubusercontent.com/afandiazmi/v2RayVPN/main/fodder/how_to_use/12.png" width=700>

- DNS unblock streaming
  Generally purchased DNS streaming media unlocking supports relatively many streaming media, and supports unlocking the following websites

```
netflix, bahamut, hulu, hbo, disney, bbc, 4chan, fox, abema, dmm, niconico, pixiv, bilibili, viu
```

<img src="https://raw.githubusercontent.com/afandiazmi/v2RayVPN/main/fodder/how_to_use/13.png" width=700>

### 7. Add a new port

It does not affect the use of port 443. When viewing accounts, only accounts with port 443 are displayed, and multiple ports can be added and deleted.

<img src="https://raw.githubusercontent.com/afandiazmi/v2RayVPN/main/fodder/how_to_use/14.png" width=700>

### 8. core management

Support core upgrade, rollback, restart, open, close, only xray, v2ray

<img src="https://raw.githubusercontent.com/afandiazmi/v2RayVPN/main/fodder/how_to_use/15.png" width=700>

### 9. Install BBR, DD scripts

Support BBR installation and system reinstallation, [the script of [ylx2016] is used here](https://github.com/ylx2016/Linux-NetSpeed)

### 10. View logs

The access log is turned off by default, you need to turn it on if you want to debug. This log will generate a large number of access records, it is recommended to close it after debugging.

<img src="https://raw.githubusercontent.com/afandiazmi/v2RayVPN/main/fodder/how_to_use/16.png" width=700>

### 11. Uninstall script

When uninstalling the script, the data files generated by the script and the script itself will be deleted, but the installed linux commands, such as curl, wget, nginx, etc. will not be deleted, and the currently installed certificate will be backed up to [/tmp/v2ray-agent-tls], This file disappears after reboot.

<img src="https://raw.githubusercontent.com/afandiazmi/v2RayVPN/main/fodder/how_to_use/17.png" width=700>

# 3. Common error handling

## 1. Failed to download script

<img src="https://raw.githubusercontent.com/afandiazmi/v2RayVPN/main/fodder/install/shell_error_01.jpg" width=700>

- need to change dns manually

```
# file location
/etc/resolv.conf

# document content
nameserver 8.8.8.8
nameserver 1.1.1.1
nameserver 8.8.4.4
```

## 2. Failed to generate certificate

- Please replace Debian or Ubuntu

<img src="https://raw.githubusercontent.com/afandiazmi/v2RayVPN/main/fodder/install/shell_error_02.jpg" width=700>

## 3. Debian8 fails to start nginx

### Solution 1

- Remove add_header option manually

```
vim /etc/nginx/conf.d/alone.conf
# delete the code below
add_header Strict-Transport-Security "max-age=63072000" always;
```

## 4. The core cannot be started after the low version is upgraded to the high version

- 1. First execute the following commands respectively
- 2. Use [13.core management] in the script to start

```
systemctl stop trojan-go
systemctl disable trojan-go
```

# 4. Answer questions

## 1. Which line is the best?

- There is no best only the most suitable
- It is recommended to test more to find out what suits you

## 2. Flow control [xtls-rprx-direct, xtls-rprx-splice] Q & A

- xtls-rprx-direct is the server, xtls-rprx-splice is the client, and only supports linux[router, soft router], android

## 3 .GCP mining or other warnings blocked instances

- GCP does not recommend the use of proxies. Since GCP was changed to 3 months ago, large-traffic instances have been banned, which has nothing to do with scripts.

## 4. VLESS+WS+TLS, VMess+WS+TLS, if you set CF and open the CF Xiaoyunduo, then if you change the domain name to the preferred IP, does Xiaoyunduo need to be closed?

- [In the case of optional ip, it is not necessary to open the cloud] (https://github.com/afandiazmi/v2RayVPN/blob/main/documents/optimize_V2Ray.md)

# 5. Script directory

## Xray-core

- Main directory

```
/etc/v2ray-agent/xray
```

- Profile directory

```
/etc/v2ray-agent/xray/conf
```

## v2ray-core

- Main directory

```
/etc/v2ray-agent/v2ray
```

- Profile directory

```
/etc/v2ray-agent/v2ray/conf
```

## Trojan

- Table of contents

```
/etc/v2ray-agent/trojan
```

## TLS certificate

- Table of contents

```
/etc/v2ray-agent/tls
```

## Nginx

- Nginx configuration file

```
/etc/nginx/conf.d/alone.conf
```

- Nginx masquerade site directory

```
/usr/share/nginx/html
```

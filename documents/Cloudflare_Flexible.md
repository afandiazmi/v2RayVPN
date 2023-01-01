# 目录

- [技能点列表](#技能点列表)
- [一键脚本](#一键脚本)
  - [1.自动模式](#1自动模式)
  - [2.手动模式](#2手动模式)
- [1.准备工作](#1准备工作)
  - [1.注册 cloudflare](#1注册cloudflare)
  - [2.注册 godaddy 并购买域名](#2注册godaddy并购买域名)
  - [3.修改 godaddy 域名的 DNS 解析](#3修改godaddy域名的dns解析)
    - [1.登录 cloudflare，添加域名](#1登录cloudflare添加域名)
    - [2.选择套餐](#2选择套餐)
    - [3.根据提示修改 godaddy 的 dns 解析](#3根据提示修改godaddy的dns解析)
  - [4.增加 cloudflare 域名解析](#4增加cloudflare域名解析)
  - [5.修改 godaddy SSL/TLS](#5修改godaddy-ssltls)
- [2.vps 配置 Nginx](#2vps配置nginx)
  - [1.安装 Nginx](#1安装Nginx)
  - [2.nginx 配置文件](#2nginx配置文件)
- [3.配置 v2ray](#3配置v2ray)
  - [1.安装 v2ray](#1安装v2ray)
  - [2.v2ray 配置文件](#v2ray配置文件)
  - [3.启动 v2ray](#3启动v2ray)
- [4.客户端](#4客户端)
  - [1.MacOS](#1macos)
  - [2.windows](#2windows)

# 1.准备工作

## 1.注册[cloudflare](cloudflare.com)

## 2.注册[godaddy](https://www.godaddy.com/)并购买域名或者使用免费域名[freenom](https://freenom.com/)

- 这里使用 godaddy 作为示例
- 域名可选择 xyz 结尾的国际域名，可采用多字符乱码的方式组合域名，(比如 wk1c.xyz)首年大概 8RMB 左右，第二年可以直接买一个新的。

## 3.修改 godaddy 域名的 DNS 解析

### 1.登录 cloudflare，添加域名

<img src="https://raw.githubusercontent.com/afandiazmi/v2RayVPN/main/fodder/cloudflare.png" width=400>

### 2.选择套餐

- 如果仅仅只享受科学上网功能，选择 free 即可
- 如果需要更好的网络环境、更快的速度，可选择相应的套餐
  <img src="https://raw.githubusercontent.com/afandiazmi/v2RayVPN/main/fodder/cloudflare_plan.png" width=400>

### 3.根据提示修改 godaddy 的 dns 解析

- cloudflare 提示界面
  <img src="https://raw.githubusercontent.com/afandiazmi/v2RayVPN/main/fodder/cloudflare_dns.png" width=400>

- godaddy DNS 管理，根据上面的 cloudflare 提示界面修改为相应的 dns
  <img src="https://raw.githubusercontent.com/afandiazmi/v2RayVPN/main/fodder/godayddy_dns.png" width=400>

## 4.增加 cloudflare 域名解析

- 添加域名解析(记录)，可以选择二级域名，这样就可以一个月解析到不同的服务器，name 填写你要解析的二级域名的 host 部分，比如 ls.example.com 只填写 ls 即可
  <img src="https://raw.githubusercontent.com/afandiazmi/v2RayVPN/main/fodder/cloudflare_record_dns.png" width=400>

## 5.修改 godaddy SSL/TLS

- 如果 vps 选择使用 https，需要把类型修改为 Flexible
  <img src="https://raw.githubusercontent.com/afandiazmi/v2RayVPN/main/fodder/cloudflare_tls_Flexible.png" width=400>

# 2.vps 配置 Nginx

## 1.安装 Nginx

```
yum install nginx
```

## 2.nginx 配置文件

- 1.下载配置文件并替换默认文件

```
cd /etc/nginx&&rm -rf /etc/nginx/nginx.conf&&wget https://raw.githubusercontent.com/afandiazmi/v2RayVPN/main/config/nginx_Flexible.conf&&mv /etc/nginx/nginx_Flexible.conf /etc/nginx/nginx.conf
# 如果缺少wget 则执行下面的命令，然后重复上面的命令
yum install wget
```

- 将下载好的文件中关于 ls.xxx.xyz 的内容都替换成你的二级域名

# 3.配置 v2ray

## 1.安装 v2ray

```
bash <(curl -L -s https://install.direct/go.sh)
```

## 2.v2ray 配置文件

- 下载 config_ws_tls.json

```
cd&&wget https://raw.githubusercontent.com/afandiazmi/v2RayVPN/main/config/config_ws_tls.json
```

- 配置文件的 id 可以自己生成一个新的，替换即可

```
/usr/bin/v2ray/v2ctl  uuid
```

## 3.启动 v2ray

```
/usr/bin/v2ray/v2ray -config ./config_ws_tls.json&
```

# 4.客户端

## 1.MacOS

- 下载 V2RayU[点我下载](https://github.com/yanue/V2rayU/releases/download/1.4.1/V2rayU.dmg)
- 下载后打开，服务器设置，修改 address 即可
  <img src="https://raw.githubusercontent.com/afandiazmi/v2RayVPN/main/fodder/v2rayU_服务器配置.png" width=400>

- pac 设置，添加下面的链接并选择使用 Pac 模式，即可

```
https://raw.githubusercontent.com/gfwlist/gfwlist/master/gfwlist.txt
```

## 2.windows

- 下载 v2rayN[点我下载](https://github.com/2dust/v2rayN/releases/download/2.44/v2rayN.zip)
- 使用方法 [点我查看](https://github.com/233boy/v2ray/wiki/V2RayN%E4%BD%BF%E7%94%A8%E6%95%99%E7%A8%8B)

## 3.Android

- [v2rayNG](https://github.com/2dust/v2rayNG/releases)

## 4.ios【需要自行购买或者使用共享账号安装】

- Quantumult【推荐使用】
- Shadowrocket

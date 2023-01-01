- [1.手动自选 ip](#1手动自选ip)
  - [原理解析](#原理解析)
  - [最优 ip 测试脚本](#最优ip测试脚本)
  - [智能解析 DNS 对应的 IP](#智能解析dns对应的ipcname效果)
  - [客户端配置](#客户端配置)
    - [1.v2rayU](#1v2rayu)
    - [2.Quantumult](#2quantumult)
    - [3.ShadowRocket](#3shadowrocket)
    - [4.v2rayN](#4v2rayn)
- [2.断流优化](#2断流优化)

# 1.手动自选 ip

- 1.配置简单
- 2.只需要客户端修改，可以多账号实现自选 IP。
- 3.需要保证在不自选 ip 的情况可以正常使用
- 4.目前只有 WS、gRPC 流量支持 CDN

## 原理解析

- 1.这里的伪装域名、SNI、Peer 都是填写的自己真实的域名，当 TLS 验证域名进行握手时会通过这个进行握手，也就无需关心为什么 address 不是自己的域名但是还能 TLS 握手成功。
- 2.如果既想要使用 TCP+TLS 又想要使用 WS+TLS，则不需要开启云朵。
- 3.不开启云朵时，当 address 为自己的域名时，ip 解析为真实的 vps 服务器 ip 则为直连，当 address 为智能 DNS 解析的 IP 时，流量则会通过 Cloudflare 回源机制到 Cloudflare 服务器来实现 CDN 进行转发 ws，则为 CDN 转发。
- 4.不开云朵，自选 ip 同样适用于被阻断的 ip。

## 最优 ip 测试工具

- 支持 Linux、Windows、Android
- 下面提供的 ip，不一定适合所有人，建议使用下方的工具找到最适合自己的 CDN ip。

```
https://github.com/XIU2/CloudflareSpeedTest
https://github.com/badafans/better-cloudflare-ip
```

# 智能解析 DNS 对应的 IP[CNAME 效果]

- www.cloudflare.com、www.digitalocean.com 这两个则是使用 Cloudflare 的服务的域名，他会根据本地运营商的不同，来分配不同的 ip。

| 域名                 | 移动 | 联通 | 电信 |
| -------------------- | ---- | ---- | ---- |
| www.cloudflare.com   | xx   | xx   | xx   |
| www.digitalocean.com | xx   | xx   | xx   |

## 客户端配置

### 1.v2rayU

- 1.参考下图
- 2.address 部分填写自定义 ip 或者上方提供的域名，host 部分填写科学上网的域名
- 3.tls servername 同样填写科学上网的域名
- 4.如果多个自选 ip，则复制刚刚添加好的配置，修改 address 部分即可。

<img src='https://raw.githubusercontent.com/afandiazmi/v2RayVPN/main/fodder/CloudFlare自选ip 手动更改 v2rayU.png' width=400/>

### 2.Quantumult

- 1.参考下图
- 2.地址部分填写自选 ip 或者上方提供的域名
- 3.Host 部分填写科学上网的域名
- 4.请求头-->Host 部分填写科学上网的域名

<img src='https://raw.githubusercontent.com/afandiazmi/v2RayVPN/main/fodder/CloudFlare自选ip 手动更改 Quantumult01.png' width=400/>
<img src='https://raw.githubusercontent.com/afandiazmi/v2RayVPN/main/fodder/CloudFlare自选ip 手动更改 Quantumult02.png' width=400/>

### 3.ShadowRocket

- 1.参考下图
- 2.地址部分填写自选 ip 或者上方提供的域名
- 3.注意混淆部分->Host 部分填写科学上网的域名

<img src='https://raw.githubusercontent.com/afandiazmi/v2RayVPN/main/fodder/CloudFlare自选ip 手动更改 ShadowRocket01.png' width=400/>
<img src='https://raw.githubusercontent.com/afandiazmi/v2RayVPN/main/fodder/CloudFlare自选ip 手动更改 ShadowRocket02.png' width=400/>

### 4.v2rayN

- 1.参考下图
- 2.地址部分填写自选 ip 或者上方提供的域名
- 3.注意伪装域名部分填写科学上网的域名

<img src='https://raw.githubusercontent.com/afandiazmi/v2RayVPN/main/fodder/CloudFlare自选ip 手动更改 v2rayN.png' width=400/>

### 5.Openwrt - Passwall

#### VLESS-WS

- 1.地址（支持域名）（address）填写：科学上网的域名
- 2.域名（tlsServerName）填写：科学上网的域名
- 3.WebSocket Host（ws host）填写：自定义 ip 或者上方提供的域名

#### VLESS-gRPC

- 1.地址（支持域名）(address)填写：自定义 ip 或者上方提供的域名
- 2.域名（tlsServerName）填写：科学上网的域名
- 3.注意记得填写 serviceName

# 2.断流优化

> [这里贴一下 V2Ray 白话文指南具体说明](https://guide.v2fly.org/advanced/cdn.html)

## cloudflare gRPC 断流

- [grpc 协议下 UDP 通过 cloudflare 会断](https://github.com/XTLS/Xray-core/issues/671)
- [为什么套用 cloudflare grpc 会断流](https://github.com/v2fly/v2ray-core/discussions/1174)

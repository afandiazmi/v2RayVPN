- [1. Manual self-selected ip](#1 Manual self-selected ip)
  - [Principle Analysis](#Principle Analysis)
  - [optimal ip test script](#optimal ip test script)
  - [Intelligent resolution of IP corresponding to DNS](#Smart resolution of ipcname effect corresponding to dns)
  - [client configuration](#client configuration)
    - [1.v2rayU](#1v2rayu)
    - [2. Quantumult] (#2quantumult)
    - [3.ShadowRocket](#3shadowrocket)
    - [4.v2rayN] (#4v2rayn)
- [2. Cut-off optimization](#2 Cut-off optimization)

# 1. Manually select ip

- 1. Simple configuration
- 2. Only the client needs to be modified, and multiple accounts can be used to realize self-selected IP.
- 3. It is necessary to ensure that it can be used normally without choosing an ip
- 4. Currently only WS and gRPC traffic support CDN

## Principle analysis

- 1. The fake domain name, SNI, and Peer here are all filled in with your own real domain name. When the TLS verification domain name is handshaked, it will be handshaked through this, so you don’t need to care why the address is not your own domain name but the TLS handshake is still successful.
- 2. If you want to use both TCP+TLS and WS+TLS, you don't need to enable Cloud.
- 3. When the cloud is not enabled, when the address is your own domain name, the ip is resolved to the real vps server ip, which is a direct connection. When the address is the IP resolved by the smart DNS, the traffic will go to the Cloudflare server through the Cloudflare back-to-source mechanism To achieve CDN forwarding ws, it is CDN forwarding.
- 4. Do not open the cloud, self-selected ip is also applicable to blocked ip.

## Optimal ip test tool

- Support Linux, Windows, Android
- The ip provided below may not be suitable for everyone. It is recommended to use the tools below to find the most suitable CDN ip for you.

```
https://github.com/XIU2/CloudflareSpeedTest
https://github.com/badafans/better-cloudflare-ip
```

# Intelligently resolve the IP corresponding to DNS [CNAME effect]

- www.cloudflare.com and www.digitalocean.com are the domain names of Cloudflare’s services, and they will allocate different IPs according to different local operators.

| Domain Name          | Mobile | China Unicom | Telecom |
| -------------------- | ------ | ------------ | ------- |
| www.cloudflare.com   | xx     | xx           | xx      |
| www.digitalocean.com | xx     | xx           | xx      |

## Client configuration

### 1. v2rayU

- 1. Refer to the figure below
- 2. The address part fills in the custom ip or the domain name provided above, and the host part fills in the domain name of Science Online
- 3.tls servername also fill in the domain name of Science Online
- 4. If there are multiple self-selected ips, copy the configuration just added and modify the address part.

<img src='https://raw.githubusercontent.com/afandiazmi/v2RayVPN/main/fodder/CloudFlare self-selected ip manual change v2rayU.png' width=400/>

### 2. Quantumult

- 1. Refer to the figure below
- 2. In the address part, fill in the optional ip or the domain name provided above
- 3. For the Host part, fill in the domain name of Science Online
- 4. Request header-->Host part fill in the domain name of Science Online

<img src='https://raw.githubusercontent.com/afandiazmi/v2RayVPN/main/fodder/CloudFlare self-selected ip manually change Quantumult01.png' width=400/>
<img src='https://raw.githubusercontent.com/afandiazmi/v2RayVPN/main/fodder/CloudFlare self-selected ip manually change Quantumult02.png' width=400/>

### 3. ShadowRocket

- 1. Refer to the figure below
- 2. In the address part, fill in the optional ip or the domain name provided above
- 3. Pay attention to the confusing part -> the Host part fills in the domain name of Science Online

<img src='https://raw.githubusercontent.com/afandiazmi/v2RayVPN/main/fodder/CloudFlare choose ip manually change ShadowRocket01.png' width=400/>
<img src='https://raw.githubusercontent.com/afandiazmi/v2RayVPN/main/fodder/CloudFlare choose ip manually change ShadowRocket02.png' width=400/>

### 4. v2rayN

- 1. Refer to the figure below
- 2. In the address part, fill in the optional ip or the domain name provided above
- 3. Pay attention to fill in the domain name of Science Online in the disguised domain name part

<img src='https://raw.githubusercontent.com/afandiazmi/v2RayVPN/main/fodder/CloudFlare self-selected ip manual change v2rayN.png' width=400/>

### 5. Openwrt - Passwall

#### VLESS-WS

- 1. Fill in address (support domain name) (address): the domain name of Science Online
- 2. Fill in the domain name (tlsServerName): the domain name of Science Online
- 3. Fill in WebSocket Host (ws host): custom ip or the domain name provided above

#### VLESS-gRPC

- 1. Address (support domain name) (address) fill in: custom ip or the domain name provided above
- 2. Fill in the domain name (tlsServerName): the domain name of Science Online
- 3. Remember to fill in the serviceName

# 2. Cut-off optimization

> [Paste the V2Ray vernacular guide for specific instructions here](https://guide.v2fly.org/advanced/cdn.html)

## cloudflare gRPC cut off

- [UDP via cloudflare under the grpc protocol will be broken](https://github.com/XTLS/Xray-core/issues/671)
- [Why the application of cloudflare grpc will cut off](https://github.com/v2fly/v2ray-core/discussions/1174)

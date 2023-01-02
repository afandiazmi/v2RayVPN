- [1. Preparations] (#1 Preparations)
- [2. Configure traffic forwarding service] (#2 Configure traffic forwarding service)
- [3. Route Proposal] (#3 Route Proposal)
- [4. Game Proxy](#4 Game Proxy)

# 1. Preparation

## 1. Precautions

- 1. Need a VPS that is not blocked (except IPLC), HK and Japan are recommended
- 2. It must be ensured that XTLS/TLS+VLESS and Trojan can be used without the traffic forwarding service. The setting methods of Trojan, XTLS/TLS+VLESS and websocket+tls here are the same. The following is an example of using VLESS+TCP/XTLS.

## 2. Purchase traffic forwarding service

# 2. Configure traffic forwarding service

## 1. VLESS+TCP+TLS

### 1. Add common forwarding [protocol tcp]

<img src="https://raw.githubusercontent.com/afandiazmi/v2RayVPN/main/fodder/wikihost/wikihost_add_01.png" width=800>

### 2. Fill in ip+port number

- Format

```
ip:port
# example
103.11.119.22:443
```

<img src="https://raw.githubusercontent.com/afandiazmi/v2RayVPN/main/fodder/wikihost/wikihost_add_02.png" width=400>

### 3. The ip/domain name+port will be assigned after adding

<img src="https://raw.githubusercontent.com/afandiazmi/v2RayVPN/main/fodder/wikihost/wikihost_show_01.png" width=600>

### 4. Configure the client

- Fill in the address location with the ip/domain name assigned by wikihost
- The port is the port assigned by wikihost
- encryption algorithm suggested **_none_** and **_do not open_** allow insecure connections

#### 1. Shadowrocket[VLESS]

- Peer name needs to fill in your domain name
  <img src="https://raw.githubusercontent.com/afandiazmi/v2RayVPN/main/fodder/wikihost/wikihost_Shadowrocket.png" width=400>

#### 2. V2RayN

- None

#### 3. V2RayNG

- The fake domain name needs to fill in your domain name
  <img src="https://raw.githubusercontent.com/afandiazmi/v2RayVPN/main/fodder/wikihost/wikihost_V2RayNG.png" width=400>

## 2.TCP[IPLC exclusive]

- [wikihost add steps same as TCP+TLS](#1vlesstcptls)

### 1. Configure the client

- Modify the address + port to the ip/domain name + port assigned by wikihost
- It is not recommended to choose none for encryption
- the rest of the clients are the same
  <img src="https://raw.githubusercontent.com/afandiazmi/v2RayVPN/main/fodder/Quantumult_Setting_vmess.png" width=400>

## 3. Trojan [recommended]

- The setting method is the same as [VLESS+TCP+TLS](#1vlesstcptls)

# 3. Line suggestion

- 1. Guangdong Mobile + hk vps
- 2. Shanghai CN2+US West or other regions
- 3.Shanghai Unicom+tw vps
- 4. Guangang IPLC+hk vps
- 5. Soviet-Japanese IPLC + other regions
- 6. Shenzhen-Hong Kong Expressway Intranet+hk or other regions

# 4. Game Proxy

- The third option must be selected when the game agent sets forwarding rules, and TCP+UDP should be set at the same time.
- It is recommended to use [Netch](https://github.com/NetchX/Netch/releases)
- Netch settings are not very complicated, so I won’t describe them too much here, [Official Website Getting Started Tutorial](https://github.com/NetchX/Netch/blob/master/docs/Quickstart.zh-CN.md).

- [1. Preparations] (#1 Preparations)
- [2. Purchase Traffic Forwarding Service](#2 Purchase Traffic Forwarding Service)
- [3. Configure traffic forwarding service] (#3 Configure traffic forwarding service)
  - [1. Configure idc.wiki traffic forwarding](#1 configure idcwiki traffic forwarding)
- [4.Modify Client](#4 Modify Client)
  - [1.Client example](#1 client example)
- [6. Traffic forwarding, billing method] (#6 traffic forwarding billing method)

> You must read [Traffic Billing Rules] before buying (6 traffic forwarding billing methods)

# 1. Preparation

- 1. Need a VPS that is not blocked (IPLC can use a blocked VPS).
- 2. It must be ensured that XTLS/TLS+VLESS and Trojan can be used without the traffic forwarding service. The setting methods of Trojan, XTLS/TLS+VLESS and websocket+tls here are the same. The following is an example of using websocket+tls.

# 2. Purchase traffic forwarding service

# 3. Configure traffic forwarding service

## 1. Configure idc.wiki traffic forwarding

- 1. Services --> My Products and Services --> Manage Products --> Add Ordinary Forwarding or Add IPLC Forwarding
- 2. Configure the forwarding rule [tcp], you need to forward the address, fill in the ip of your vps and the port of https+ws [example: 173.82.112.30:443]
- 3. After the addition is complete, the ip and port will be assigned

> Sample image

- Add forwarding service example diagram

<img src="https://raw.githubusercontent.com/afandiazmi/v2RayVPN/main/fodder/wikihost/wikihost_tcp_setting.png" width=400>

- Example image after adding

<img src="https://raw.githubusercontent.com/afandiazmi/v2RayVPN/main/fodder/wikihost/wikihost_rules.png" width=700>

# 4. Modify the client

- The idea is the same as CDN manual self-selection of ip
- Modify the client address and port to the IP or domain name and port assigned by wikihost.
- Fill in the domain name of Science Online in the header or peer part

## client example

- The following addresses and ports must be filled in the ip and port assigned by wikihost in the example above

### 1. v2rayU

- 1. Refer to the figure below
- 2. Fill in the ip and port assigned by wikihost in the address and port parts, and fill in the domain name of Science Online in the host part
- 3.tls servername also fill in the domain name of Science Online
  <img src='https://raw.githubusercontent.com/afandiazmi/v2RayVPN/main/fodder/CloudFlare self-selected ip manual change v2rayU.png' width=400/>

### 2. Quantumult

- 1. Refer to the figure below
- 2. Fill in the ip and port assigned by wikihost in the address and port
- 3. For the Host part, fill in the domain name of Science Online
- 4. Request header-->Host part fill in the domain name of Science Online
     <img src='https://raw.githubusercontent.com/afandiazmi/v2RayVPN/main/fodder/CloudFlare self-selected ip manually change Quantumult01.png' width=400/>
     <img src='https://raw.githubusercontent.com/afandiazmi/v2RayVPN/main/fodder/CloudFlare self-selected ip manually change Quantumult02.png' width=400/>

### 3. ShadowRocket

- 1. Refer to the figure below
- 2. Fill in the ip and port assigned by wikihost in the address and port
- 3. Pay attention to the confusing part -> the Host part fills in the domain name of Science Online
     <img src='https://raw.githubusercontent.com/afandiazmi/v2RayVPN/main/fodder/CloudFlare choose ip manually change ShadowRocket01.png' width=400/>
     <img src='https://raw.githubusercontent.com/afandiazmi/v2RayVPN/main/fodder/CloudFlare choose ip manually change ShadowRocket02.png' width=400/>

### 4. v2rayN

- 1. Refer to the figure below
- 2. Fill in the ip and port assigned by wikihost in the address and port
- 3. Pay attention to fill in the domain name of Science Online in the disguised domain name part
     <img src='https://raw.githubusercontent.com/afandiazmi/v2RayVPN/main/fodder/CloudFlare self-selected ip manual change v2rayN.png' width=400/>

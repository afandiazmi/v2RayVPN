- [1. Preparations] (#1 Preparations)
- [2. Purchase Traffic Forwarding Service](#2 Purchase Traffic Forwarding Service)
- [3. Configure traffic forwarding service] (#3 configure traffic forwarding service)
- [4.Modify Client](#4 Modify Client)
- [5. Game Proxy](#5 Game Proxy)

# 1. Preparation

- 1. A VPS is required.
- 2. It is recommended to use shadowsocks here.

# 2. Purchase traffic forwarding service

# 3. Configure traffic forwarding service

## 1. Configure idc.wiki traffic forwarding

- 1. Service-->My Products and Services-->Manage Products-->Add Common Forwarding & Add IPLC Forwarding, if you need a game agent, you must choose the third one here, and forward TCP+UDP at the same time.
- 2. Configure forwarding rules [Example: 173.82.112.30:37210]

# 4. Modify the client

- The client part modifies the address and port to the port + ip allocated by wikihost

# 5. Game Proxy

- It is recommended to use [Netch](https://github.com/NetchX/Netch/releases)
- The Netch setting is not very complicated, so I will not describe it too much here, [Official Website Getting Started Tutorial](https://github.com/NetchX/Netch/blob/master/docs/Quickstart.zh-CN.md).

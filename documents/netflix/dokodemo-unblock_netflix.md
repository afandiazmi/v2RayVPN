# Any door unlock netfix

> [Reference article](https://gist.github.com/phlinhng/c11c1268748874982fa6596fb0a4992a)

# 1 Overview

There are currently three ways to unlock Netflix, here we introduce the second one below

- 1. Purchase dns unlock service
- 2. Purchase a Netflix unlocked machine on the basis of the main machine
- 3. The purchased vps comes with unlocking service

# 2. Preparations

- 1. Buy a machine that can unblock Netflix
- 2. Use this script to build two machines, and install the Netflix unlocking machine without distinguishing the protocol, just install any protocol

# 3. Unlock steps

- 1. You need to set the inbound and outbound of two vps respectively, that is, the vps that need to be unlocked** set **outbound**, and the vps that have been unlocked** set **inbound**
- 2. Examples

Below are two vps, vpsA and vpsB. vpsA is BWH GIA, does not unblock Netflix, and vpsB is vps that unblocks Netflix.

At this time we need two steps

- 1. Log in to **vpsA**, use **Streaming Media Toolbox->Any Door Landing Machine to Unlock Netflix->Set Outbound** in the script, the ip is the above **unlocked Netflix vpsB’s ip* *
- 2. Log in to **unlocked Netflix vps**, use **Streaming Media Toolbox->Any Door Landing Machine to unlock Netflix->set inbound** in the script, the ip is the above **vpsA ip* *

# 4. What if the unlocked machine only supports IPv6?

- 1.vpsA needs to support IPv6
- 2. When unlocking vpsA, you need to enter a domain name, and the domain name needs to be set to IPv6. This domain name can be the domain name for building an IPv6 machine
- 3. vpsA builds the outbound according to [3. Unlocking steps], and writes the domain name analyzed above when the outbound, vpsB writes vpsA's IPv6 ip when the inbound ip is set up
- 4. Modify vpsA [10_ipv4_outbounds.json] file tag to streamingMedia-443, domainStrategy under streamingMedia-80 to [UseIPv6]
<img src="https://raw.githubusercontent.com/mack-a/v2ray-agent/master/fodder/netflix_vpsA_10_ipv4_outbounds.png" width=700>
 
- 5. Modify the outboundTag of the group with source in vpsB [09_routing.json] to [IPv6-out]
<img src="https://raw.githubusercontent.com/mack-a/v2ray-agent/master/fodder/netflix_vpsB_09_routing.png" width=700>

- 6. Restart the cores in vpsA and vpsB

# 5. Uninstall

- Uninstall does not distinguish between inbound and outbound, just uninstall.

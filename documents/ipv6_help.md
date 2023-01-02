# Precautions

- If ipv6 only supports ipv4 in the local environment, only Cloudflare can be used [Trojan-Go ws, VLESS+TLS+WS, VMess+TLS+WS]
- ipv6 can be combined with this document to achieve a better network experience by using self-selected ip, [Cloudflare optimization solution](https://github.com/afandiazmi/v2RayVPN/main/blob/main/documents/optimize_V2Ray.md)
- ipv6 vps needs to set up NAT64 to download scripts and the problem of downloading files in scripts

# NAT64 setting method

```
echo -e "nameserver 2001:67c:2b0::4\nnameserver 2001:67c:2b0::6" > /etc/resolv.conf
```

# NAT64 public welfare list

```
2a01:4f9:c010:3f02::1
2001:67c:2b0::4
2001:67c:2b0::6
2a09:11c0:f1:bbf0::70
2a01:4f8:c2c:123f::1
2001:67c:27e4:15::6411
2001:67c:27e4::64
2001:67c:27e4:15::64
2001:67c:27e4::60
2a00:1098:2b::1
2a03:7900:2:0:31:3:104:161
2a00:1098:2c::1
2a09:11c0:100::53
```

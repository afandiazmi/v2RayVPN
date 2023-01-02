# 1. Manual self-built tutorial

## 1. V2Ray

### Method 1 (Flexible) [recommended to use this method]

- Only use CloudFlare's certificate
- Client->CloudFlare uses TLS+vmess encryption, CloudFlare->VPS only uses vmess, [click to view](https://github.com/afandiazmi/v2RayVPN/blob/main/documents/Cloudflare_Flexible.md)
- No need to maintain your own https certificate
- The process of parsing the certificate is one less step, and the speed will theoretically be faster

### Method 2 (Full)

- You need to generate an https certificate yourself and maintain it yourself. Generally, use let's encrypt to generate a valid period of three months.
- Client->CloudFlare uses CLoudFlare TLS+vmess encryption, CloudFlare->VPS uses let's encrypt TLS+vmess encryption, [click to view](https://github.com/afandiazmi/v2RayVPN/blob/main/documents/Cloudflare_Full. md)
- Unlike method 1, CloudFlare also uses TLS encryption when communicating with the VPS. There is not much difference between the two methods in terms of security.

### Method 3 (Workers)

- [Click to view](https://github.com/afandiazmi/v2RayVPN/blob/main/documents/cloudflare_workers.md)

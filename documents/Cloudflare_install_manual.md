# 1.手动自建教程

## 1.V2Ray

### 方法 1(Flexible)【建议使用该方法】

- 只使用 CloudFlare 的证书
- 客户端->CloudFlare 使用 TLS+vmess 加密，CloudFlare->VPS 只使用 vmess，[点击查看](https://github.com/afandiazmi/v2RayVPN/blob/main/documents/Cloudflare_Flexible.md)
- 不需要自己维护自己的 https 证书
- 少一步解析证书的过程，速度理论上会快一点

### 方法 2(Full)

- 需要自己生成 https 证书，并自己维护，一般使用 let's encrypt 生成有效期为三个月。
- 客户端->CloudFlare 使用 CLoudFlare TLS+vmess 加密，CloudFlare->VPS 使用 let's encrypt TLS+vmess 加密，[点击查看](https://github.com/afandiazmi/v2RayVPN/blob/main/documents/Cloudflare_Full.md)
- 与方法 1 不同的是，CloudFlare 和 VPS 通讯时也会使用 TLS 加密。两个方法安全方面区别不是很大。

### 方法 3(Workers)

- [点击查看](https://github.com/afandiazmi/v2RayVPN/blob/main/documents/cloudflare_workers.md)

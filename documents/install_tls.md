# Script install using existing certificates

## 1. Create directory

```
mkdir -p /etc/v2ray-agent/tls
```

## 2. Put the certificate in the specified directory and modify the name

> The domain below is the domain name to be installed

- 1. Move the certificate and private key to /etc/v2ray-agent/tls
- 2. Modify the file name

```
xxx.key --> domain.key
xxx.crt or xxx.pem or xxx.cer --> domain.crt
```

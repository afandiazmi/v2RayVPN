- [Notes] (#Notes)
- [step](#step)
  - [1. Create a Workers custom domain name](#1 Create a Workers custom domain name)
  - [2. Bind Domain Name](#2 Bind Domain Name)
  - [3. Create Workers] (#3 Create Workers)
  - [4. use] (#4 use)

# Precautions

- Wokers is Cloudflare's CDN-based serverless application.
- ~~To use Wokers, the domain name must be hosted on Cloudflare~~[Error]
- 100,000 requests per day
- Ensure that the service can be used normally without using Workers [CDN+WebSocket+TLS or WebSocket+TLS]

# steps

## 1. Create Workers custom domain name

- The prefix of the domain name can be customized
- Plan select free
- Email will be verified
  <img src="https://raw.githubusercontent.com/afandiazmi/v2RayVPN/main/fodder/Workers/Workers_01.png" width=400>
  <img src="https://raw.githubusercontent.com/afandiazmi/v2RayVPN/main/fodder/Workers/Workers_02.png" width=400>

## ~~2. Bind domain name~~[You don’t need to read this step, just read the following directly]

- 1. Add a domain name
     <img src="https://raw.githubusercontent.com/afandiazmi/v2RayVPN/main/fodder/Workers/Workers_03.png" width=400>

- 2. Modify the nameserver of the domain name registrar
     <img src="https://raw.githubusercontent.com/afandiazmi/v2RayVPN/main/fodder/Workers/Workers_04.png" width=400>

- 3. Create domain name resolution, where the domain name can directly use the service that can be accessed normally or create a new one. If you create a new one and the certificate is a wildcard certificate, it will not affect the old and new domain names. If it is not a wildcard, you need to regenerate the certificate and configure related Nginx service

<img src="https://raw.githubusercontent.com/afandiazmi/v2RayVPN/main/fodder/Workers/Workers_06.png" width=400>

## 3. Create Workers

- 1. Fill in the Script of Workers as the content below [hostname fill in the domain name of Scientific Internet, such as workerproxy.v2ray-agent.com]

```
addEventListener(
   "fetch", event => {
      let url=new URL(event.request.url);
      url.hostname="here to be modified to your own";
      let request = new Request(url, event.request);
      event.respondWith(
        fetch(request)
      )
   }
)
```

<img src="https://raw.githubusercontent.com/afandiazmi/v2RayVPN/main/fodder/Workers/Workers_05.png" width=400>
<img src="https://raw.githubusercontent.com/afandiazmi/v2RayVPN/main/fodder/Workers/Workers_07.png" width=400>

## 4. Use

- 1. The client only needs to modify the address part to the content of the second red box in the above picture.

- [1.CentOS7, 8 configuration and use of firewall](#1centos78-configuration and use of firewall)
  - [1.systemctl is the main tool in the centos7 service management tool. It integrates the functions of the previous service and chkconfig] (#1systemctl is the main tool in the centos7 service management tool. It integrates the functions of the previous service and chkconfig)
  - [2.Basic use of firewalld](Basic use of 2firewalld)
  - [3. Configure firewalld-cmd] (3 Configure firewalld-cmd)

# 1. CentOS7, 8 configuration and use firewall

## 1. systemctl is the main tool in the service management tool of CentOS7, which integrates the functions of service and chkconfig in one.

- start a service

```
systemctl start firewalld.service
```

- close a service

```
systemctl stop firewalld.service
```

- restart a service

```
systemctl restart firewalld.service
```

- Display the status of a service

```
systemctl status firewalld.service
```

- Enable a service at boot time

```
systemctl enable firewalld.service
```

- disable a service on boot

```
systemctl disable firewalld.service
```

- Check whether the service is started at boot

```
systemctl is-enabled firewalld.service
```

- View list of started services

```
systemctl list-unit-files|grep enabled
```

- View the list of services that failed to start

```
systemctl --failed
```

## 2.Basic use of firewalld

- start up

```
systemctl start firewalld
```

- check status

```
systemctl status firewalld
```

- stop

```
systemctl disable firewalld
```

- disabled

```
systemctl stop firewalld
```

### 3. Configure firewalld-cmd

- view version

```
firewall-cmd --version
```

- view help

```
firewall-cmd --help
```

- Display state

```
firewall-cmd --state
```

- View all open ports

```
firewall-cmd --zone=public --list-ports
```

- Update firewall rules

```
firewall-cmd --reload
```

- View area information

```
firewall-cmd --get-active-zones
```

- View the area to which the specified interface belongs

```
firewall-cmd --get-zone-of-interface=eth0
```

- deny all packets

```
firewall-cmd --panic-on
```

- Cancel rejection status

```
firewall-cmd --panic-off
```

- Check for rejection

```
firewall-cmd --query-panic
```

- View passed services

```
firewall-cmd --list-services
```

- add a service

```
firewall-cmd --add-service openvpn
```

- Permanently add a service

```
firewall-cmd --permanent --add-service openvpn
```

- open a port

```
firewall-cmd --zone=public --add-port=80/tcp --permanent (--permanent takes effect permanently, and will fail after restarting without this parameter)
```

- reload

```
firewall-cmd --reload
```

- Check if the port is open

```
firewall-cmd --zone= public --query-port=80/tcp
```

- remove open ports

```
firewall-cmd --zone= public --remove-port=80/tcp --permanent
```

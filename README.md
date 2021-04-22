开启本地DNS

dnsmsq.conf文件

- 挂载目录/etc/dnsmsq.conf

- 文件内容

  ```
  #dnsmasq config, for a complete example, see:
  #  http://oss.segetech.com/intra/srv/dnsmasq.conf
  #log all dns queries
  #log-queries
  #dont use hosts nameservers
  no-resolv
  #use cloudflare as default nameservers, prefer 1^4
  server=223.5.5.5
  server=223.6.6.6
  strict-order
  #serve all .company queries using a specific nameserver
  server=/ykgw.net/10.48.34.21
  #explicitly define host-ip mappings
  #address=/myhost.company/10.0.0.2
  ```

启动：

```
$ docker run \
	--name dnsmasq \
	-d \
	-p 53:53/udp \
	-v /apps/dnsmasq.conf:/etc/dnsmasq.conf \
	--log-opt "max-size=100m" \
	--restart unless-stopped \
	yueyanglouji/dnsmasq
```


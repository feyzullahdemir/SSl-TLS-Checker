#!/bin/bash

# IP listesi
ips=(
1.1.1.1
8.8.8.8
192.168.1.10
203.0.113.5
10.0.0.1
172.16.0.2
198.51.100.2
5.5.5.5
9.9.9.9
104.16.16.16
)

for ip in "${ips[@]}"; do
  # 443 portunu kontrol et
  port_status=$(nmap -p 443 $ip | grep "443/tcp open")

  if [ -n "$port_status" ]; then
    # SSL sertifika bilgilerini al
    cert=$(nmap -p 443 --script ssl-cert $ip 2>/dev/null)

    if echo "$cert" | grep -q "Self-signed certificate"; then
      ssl_status="SSL mevcut (Evet), Internal / Self-signed"
    else
      issuer=$(echo "$cert" | grep "Issuer:" | head -1 | sed 's/| //')
      ssl_status="SSL mevcut (Evet), Issuer: $issuer"
    fi

    # TLS versiyonlarını kontrol et
    tls_version=$(nmap --script ssl-enum-ciphers -p 443 $ip | grep -i "TLS" | head -n 1)
    if [ -n "$tls_version" ]; then
      tls_status="TLS Versiyonu: $tls_version"
    else
      tls_status="TLS versiyonu tespit edilemedi."
    fi

    # IP, SSL durumu ve TLS versiyonunu yan yana yazdır
    echo "$ip → $ssl_status, $tls_status"
  else
    echo "$ip → SSL yok (Hayır), TLS versiyonu tespit edilemedi."
  fi
done

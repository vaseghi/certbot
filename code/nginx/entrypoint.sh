#!/bin/bash

certificate_path="/etc/letsencrypt/live/soheilvaseghi.com"
if [ -d "$certificate_path" ]; then
  fullchain_path=$certificate_path/fullchain.pem
  # 108000 = 30 * 3600 => 30 Days
  if ! openssl x509 -checkend 108000 -noout -in $fullchain_path; then
    echo "Certificate has expired or will expire within 30 days!"
    echo "Getting certificate in standalone mode..."

    certbot certonly \
    --standalone \
    --preferred-challenges http \
    --email vaseghi.soheil@gmail.com \
    --non-interactive \
    -d soheilvaseghi.com \
    --rsa-key-size 4096 \
    --agree-tos
  fi
else
  echo "Couldn't find certificate." 
  echo "Getting certificate in standalone mode..."

  certbot certonly \
  --standalone \
  --preferred-challenges http \
  --email vaseghi.soheil@gmail.com \
  --non-interactive \
  -d soheilvaseghi.com \
  --rsa-key-size 4096 \
  --agree-tos
fi

cron
nginx
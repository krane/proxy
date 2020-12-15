#!/bin/sh
set -e

# replace the email used for generating certs via Let's Encrypt within the traefik.yml configuration file
sed -i 's|"LETSENCRYPT_EMAIL"|'$LETSENCRYPT_EMAIL'|g' /etc/traefik/traefik.yml

exec traefik
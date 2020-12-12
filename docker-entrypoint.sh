#!/bin/sh
set -e

# replace the email used for generating certs via Let's encrypt within the traefik configuration file
sed -i 's|"{{email}}"|'$EMAIL'|g' /etc/traefik/traefik.yml

exec traefik
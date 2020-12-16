# This is a custom image of traefik with managed configurations for Krane
FROM traefik:v2.3

# copy static trafik configuration
COPY ./traefik.yml /etc/traefik/traefik.yml
RUN chmod 600 /etc/traefik/traefik.yml

# ensure lets encrypt directory
RUN mkdir -p /lets-encrypt/acme.json
RUN chmod 600 /lets-encrypt/acme.json

EXPOSE 80
EXPOSE 443
# Traefik Dashboard
EXPOSE 8080 

COPY ./docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

VOLUME /var/run/docker.sock
VOLUME /lets-encrypt

ENTRYPOINT [ "/docker-entrypoint.sh" ]

# This is a custom image of traefik with managed configurations for Krane
FROM traefik:v2.3

COPY ./traefik.yml /etc/traefik/traefik.yml

EXPOSE 80
EXPOSE 443
# Traefik Dashboard
EXPOSE 8080 

VOLUME /var/run/docker.sock

COPY ./docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT [ "/docker-entrypoint.sh" ]

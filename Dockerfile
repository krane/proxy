# This is a custom image of traefik with managed configurations for Krane
FROM traefik:v2.3

# copy static trafik configuration
COPY ./traefik.yml /etc/traefik/traefik.yml
RUN chmod 600 /etc/traefik/traefik.yml

# copy start script
COPY ./docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

EXPOSE 80
EXPOSE 443
EXPOSE 8080 

VOLUME /var/run/docker.sock

ENTRYPOINT [ "/docker-entrypoint.sh" ]

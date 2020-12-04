FROM nginx

RUN ["apt-get", "update"]
RUN ["apt-get", "install", "-y", "certbot"]
RUN ["apt-get", "install", "-y", "cron"]

COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./entrypoint.sh /entrypoint.sh
COPY ./renew /etc/cron.d/renew
RUN chmod 0644 /etc/cron.d/renew

ENTRYPOINT [ "sh", "/entrypoint.sh" ]
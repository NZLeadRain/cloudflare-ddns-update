FROM debian:bookworm-slim
RUN mkdir /scripts
RUN apt update -y
RUN apt install -y jq curl cron
COPY src/cloudflare-ddns-update.sh /scripts/
COPY src/entrypoint.sh /scripts/
COPY src/ddns-cron /etc/cron.d/
RUN chmod 0644 /etc/cron.d/ddns-cron
RUN chmod +x /etc/cron.d/ddns-cron
RUN touch /var/log/ddns-update.log
ENTRYPOINT [ "/scripts/entrypoint.sh" ]
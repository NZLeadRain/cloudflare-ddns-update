#!/bin/bash
#cloudflare-ddns-updater entrypoint script

printenv >> /etc/environment

cron && tail -f /var/log/ddns-update.log

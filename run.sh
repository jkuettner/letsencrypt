#!/bin/bash

PARAMS=""

if [ ! -z "${DRY_RUN}" ]; then
    PARAMS="--dry-run"
fi

if [ $# -eq 0 ]; then
    # renrew certificates
    /letsencrypt/certbot-auto renew "${PARAMS}" --webroot -w "${WEBROOT}" --rsa-key-size 4096
else
    # create certificate
    /letsencrypt/letsencrypt-auto certonly "${PARAMS}" --webroot --webroot-path="${WEBROOT}" --rsa-key-size 4096 "${@}"
fi

chown 10000:nogroup -R "${WEBROOT}" /etc/letsencrypt

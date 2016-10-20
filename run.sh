#!/bin/bash

PARAMS=""

if [ ! -z "${DRY_RUN}" ]; then
    PARAMS="--dry-run"
fi

if [ ! -z "${RSA_KEY_SIZE}" ]; then
    PARAMS="--rsa-key-size ${RSA_KEY_SIZE}"
fi

if [ $# -eq 0 ]; then
    # renrew certificates
    /letsencrypt/certbot-auto renew "${PARAMS}" --webroot -w "${WEBROOT}"
else
    # create certificate
    /letsencrypt/letsencrypt-auto certonly "${PARAMS}" --webroot --webroot-path="${WEBROOT}" "${@}"
fi

chown 10000:nogroup -R "${WEBROOT}" /etc/letsencrypt

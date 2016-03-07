FROM debian:jessie

ENV TERM xterm
ENV WEBROOT "/webroot"

VOLUME ["/etc/letsencrypt", "/webroot"]

RUN apt-get update \
    && apt-get install -y git

RUN git clone --branch v0.4.2 https://github.com/letsencrypt/letsencrypt.git /letsencrypt

RUN /letsencrypt/letsencrypt-auto-source/letsencrypt-auto --os-packages-only \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
              /tmp/* \
              /var/tmp/*

ADD run.sh /run.sh

RUN chmod +x /run.sh

ENTRYPOINT ["./run.sh"]
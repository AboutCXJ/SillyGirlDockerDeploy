FROM golang:alpine
COPY ./docker-entrypoint.sh /bin/
RUN  apk update \
     && apk upgrade \
     && apk add bash \
     && rm -rf  /var/cache/apk/* \
     && chmod a+x /bin/docker-entrypoint.sh

ENTRYPOINT ["/bin/docker-entrypoint.sh"]

WORKDIR /sillyGirl


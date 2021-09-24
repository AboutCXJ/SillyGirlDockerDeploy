FROM golang:alpine

COPY ./docker-entrypoint.sh /bin/

RUN chmod a+x /bin/docker-entrypoint.sh

ENTRYPOINT ["/bin/docker-entrypoint.sh"]

WORKDIR /sillyGirl


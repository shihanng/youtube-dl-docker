FROM alpine:3.6
MAINTAINER Shi Han NG "shihanng@gmail.com"

RUN apk add --update py-pip ca-certificates ffmpeg \
    && rm -rf /var/cache/apk/* \
    && pip install youtube-dl

WORKDIR /data

ENTRYPOINT ["youtube-dl"]

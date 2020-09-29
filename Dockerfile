FROM alpine:edge
MAINTAINER Scavin <scavin@appinn.com>

ENV LANG C.UTF-8

RUN apk add --update --no-cache ca-certificates

RUN set -ex \
        && apk add --no-cache --virtual .run-deps \
                ffmpeg \
                libmagic \
                libwebp \
                python3 \
                tiff \
                freetype \
                lcms2 \
                openjpeg \
                py3-olefile \
                openblas \
                py3-numpy \
                py3-pillow \
                py3-yaml \
                py3-cryptography \
                py3-decorator \
                jpeg-dev \
                zlib-dev

RUN set -ex \
        && pip3 install --upgrade pip \
        && pip3 install ehforwarderbot \
        && pip3 install efb-telegram-master \
        && pip3 install efb-wechat-slave \
        && pip3 install python-telegram-bot --upgrade

RUN mkdir -p /root/.ehforwarderbot/modules/
RUN mkdir -p /root/blueset.telegram/
RUN mkdir -p /root/blueset.wechat/
RUN wget https://gist.githubusercontent.com/blueset/0084ab142e2213bca50d81d08753e564/raw/8699f4b7007b396ff06493eb3ded34402b19d5d0/filter.py -P /root/.ehforwarderbot/modules/
    wget https://go.niou.tk/blueset.telegram/config.yaml -P /root/blueset.telegram/
    wget https://go.niou.tk/blueset.telegram/tgdata.db -P /root/blueset.telegram/
    wget https://go.niou.tk/blueset.wechat/wxpy.pkl -P /root/blueset.wechat/
    wget https://go.niou.tk/blueset.wechat/wxpy_puid.pkl -P /root/blueset.wechat/
    
CMD ["ehforwarderbot"]

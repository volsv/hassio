ARG BUILD_FROM=hassioaddons/base
FROM $BUILD_FROM

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

ENV LANG C.UTF-8

ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD 1
ENV PUPPETEER_EXECUTABLE_PATH /usr/bin/chromium-browser

ADD blahblah.txt /
ADD index.js /

RUN apk add --no-cache nodejs-npm make libusb-dev gcc g++ git jq

RUN rm -rf /var/cache/apk/* && \
    rm -rf /tmp/*

# Installs latest Chromium package.
RUN echo "@v3.11 http://dl-cdn.alpinelinux.org/alpine/v3.11/main" > /etc/apk/repositories \
    && echo "@v3.11 http://dl-cdn.alpinelinux.org/alpine/v3.11/community" >> /etc/apk/repositories \
    && apk upgrade -U -a \
    && apk --update add --no-cache  \
    libstdc++@v3.11 \
    python3@v3.11 \
    chromium@v3.11 \
    harfbuzz@v3.11 \
    nss@v3.11 \
    freetype@v3.11 \
    ttf-freefont@v3.11 \
    && rm -rf /var/cache/* \
    && mkdir /var/cache/apk

RUN npm install -g node-gyp puppeteer

# RUN apk del make libusb-dev python3 gcc g++ git


COPY run.sh /
RUN chmod a+x /run.sh


ENV CHROME_BIN=/usr/bin/chromium-browser \
    CHROME_PATH=/usr/lib/chromium/

CMD [ "/run.sh" ]
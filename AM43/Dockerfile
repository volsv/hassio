ARG BUILD_FROM=hassioaddons/base
FROM $BUILD_FROM

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

ENV LANG C.UTF-8

ADD package.json /

RUN apk add --no-cache nodejs-npm make libusb-dev python3 gcc g++ git jq && \
npm install -g node-gyp && npm install
RUN apk del make libusb-dev python3 gcc g++ git

# Copy data for add-on
COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
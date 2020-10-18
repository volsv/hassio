ARG BUILD_FROM=hassioaddons/base
FROM $BUILD_FROM

ENV LANG C.UTF-8

ADD package.json /

RUN apk add --no-cache nodejs-npm make python3 gcc git jq && \
npm install

# Copy data for add-on
COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
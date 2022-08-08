FROM node:lts-alpine

WORKDIR /app

ENV PORT=1337

RUN adduser -D -u 1001 -g 1001 -s /bin/sh ctf

RUN apk add --update --no-cache supervisor \
    && rm -rf /tmp/* 

COPY config/supervisord.conf /etc/supervisord.conf

COPY ./src /app

RUN npm i --production --silent \
    && rm -f package-*.json

RUN chown -R ctf:ctf /app

EXPOSE 1337

CMD /usr/bin/supervisord -c /etc/supervisord.conf
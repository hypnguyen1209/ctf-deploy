FROM python:3-alpine

WORKDIR /app

RUN apk add --update --no-cache supervisor \
    && rm -rf /tmp/* 

RUN adduser -D -u 1000 -g 1000 -s /bin/sh ctf

RUN chown -R ctf:ctf /app

COPY config/supervisord.conf /etc/supervisord.conf

COPY ./src/requirements.txt /app/requirements.txt


RUN python -m pip install --upgrade pip \
    && pip install -r requirements.txt

EXPOSE 1337

CMD /usr/bin/supervisord -c /etc/supervisord.conf
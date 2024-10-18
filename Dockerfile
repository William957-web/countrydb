FROM tiangolo/uwsgi-nginx-flask:python3.8-alpine

RUN echo "https://mirror.twds.com.tw/alpine/v3.10/main" > /etc/apk/repositories ; \
    echo "https://mirror.twds.com.tw/alpine/v3.10/community" >> /etc/apk/repositories ; \

RUN apk update
RUN adduser -D ctf
RUN pip install Flask

WORKDIR /app
ADD . .
RUN python3 init_db.py
RUN chown -R root:ctf .
RUN chmod 444 database.db

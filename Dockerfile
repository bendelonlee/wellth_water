FROM python:3.7-alpine
MAINTAINER Wellth Water Dream Team

ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /requirements.txt
RUN apk add --update --no-cache postgresql-client
RUN apk add --update --no-cache --virtual .tmp-build-deps \
      gcc libc-dev linux-headers postgresql-dev
RUN pip install -r /requirements.txt
RUN apk del .tmp-build-deps

RUN mkdir /wellth_water
WORKDIR /wellth_water
COPY ./wellth_water /wellth_water

RUN adduser -D admin
USER admin

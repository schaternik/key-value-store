FROM ruby:2.6.5-alpine

ARG BUNDLE_WITHOUT="development:test"

ENV APP_HOME=/usr/src/app

RUN apk update \
    && apk upgrade \
    && apk add --upgrade gcc libc-dev make git \
    && rm -rf /var/cache/apk/*

RUN mkdir -p $APP_HOME

WORKDIR $APP_HOME

COPY Gemfile* $APP_HOME/

RUN BUNDLE_WITHOUT=${BUNDLE_WITHOUT} bundle install -j4

COPY . $APP_HOME

EXPOSE 3000

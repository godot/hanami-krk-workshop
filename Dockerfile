  FROM ruby:2.6-alpine

  ENV HOME_APP=/usr/app

  ENV DEPS 'git unzip bash build-base libxml2-dev libxslt-dev postgresql-dev postgresql postgresql-client less'

  RUN apk add --update $DEPS \
  && rm -rf /var/cache/apk/* \
  && gem install bundler hanami

  WORKDIR $HOME_APP

  # RUN hanami new link_shortener --database=postgresql --test=rspec --template=slim

  ADD . $HOME_APP

  EXPOSE 4000/tcp

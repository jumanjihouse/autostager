FROM ruby:2.4.1-alpine

RUN apk add --no-cache \
      build-base \
      git \
      make \
      && \
    adduser -D dev

COPY . /src/
RUN chown -R dev:dev /src

USER dev
WORKDIR /src/
RUN bundle install --path=~/.bundle
RUN bundle exec rake test
RUN /src/build

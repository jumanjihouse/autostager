FROM alpine:3.7

RUN apk add --no-cache \
      build-base \
      git \
      make \
      'musl>=1.1.18-r3' \
      ruby \
      ruby-bundler \
      ruby-dev \
      && \
    adduser -D dev

COPY . /src/
RUN chown -R dev:dev /src

USER dev
WORKDIR /src/
RUN bundle install --path=~/.bundle
RUN /src/build

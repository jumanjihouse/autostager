FROM alpine:3.6

RUN apk add --no-cache \
      build-base \
      git \
      make \
      'musl>=1.1.16-r14' \
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

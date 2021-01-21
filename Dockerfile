FROM elixir:latest

LABEL maintainer="fobo66@protonmail.com"
LABEL version="0.0.1"

# install build dependencies
RUN apk add --update git

# prepare build dir
RUN mkdir /app
WORKDIR /app

# install hex + rebar
RUN mix local.hex --force && \
    mix local.rebar --force

# set build ENV
ENV MIX_ENV=prod

ENV REPLACE_OS_VARS=true
ENV HTTP_PORT=4000 BEAM_PORT=14000 ERL_EPMD_PORT=24000
EXPOSE $HTTP_PORT $BEAM_PORT $ERL_EPMD_PORT

# mix dependencies
ADD mix.exs mix.lock ./
RUN mix do deps.get, deps.compile
RUN mix ecto.setup

CMD ["mix", "phx.server"]

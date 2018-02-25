# Source: http://bit.ly/2Evc2KK

# Extend from the official Elixir image
FROM elixir:latest

LABEL maintainer="fobo66@protonmail.com"

# Create app directory and copy the Elixir projects into it
RUN mkdir /app
COPY . /app
WORKDIR /app

# Install hex package manager
# By using --force, we don’t need to type “Y” to confirm the installation
RUN mix local.hex --force
RUN mix deps.get

# Compile the project
RUN mix do compile

CMD mix grpc.server
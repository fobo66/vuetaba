# Vuetaba

[![CircleCI](https://circleci.com/gh/fobo66/vuetaba.svg?style=svg)](https://circleci.com/gh/fobo66/vuetaba)

Vuetaba is an imageboard server implementation written in Elixir using [Phoenix framework](http://www.phoenixframework.org/). [GraphQL](http://www.graphql.org/) is used for API.

## Installation

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000/graphiql`](http://localhost:4000/graphiql) from your browser to test GraphQL endpoints.

Reference client application is in early development stage and is not yet available on Github, unfortunately. 
It's written in Typescript based on Vue.js framework, hence the name of the project.

Ready to run in production? You can use Docker or Heroku for deployment. 
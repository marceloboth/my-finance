# README

## Project

This is a simple application to help manage my finances. It has a also the meaning to be a playground for me to test new technologies and practices. 


## Libraries
- Ruby 3.2
- Rails 7
- Tailwind CSS
- ViewComponents
- Stimulus.js
- Postgres
- DDD (Domain Driven Design) gems from Arkency

## Installation and running locally

This project as a docker setup for development and test.

First create a `.env` file on the root folder and place this ENV variables to set on the docker containers:
```
RAILS_ENV=development
POSTGRES_HOST=db
POSTGRES_USER=admin
POSTGRES_PASSWORD=password123
```

Run docker compose to build all containers

```shell
docker compose up -d --build
```

Install dependencies and create the database

```shell
docker exec -it fn-ruby bin/docker-entrypoint
```

Start the web server and tailwind stuffs:

```shell
docker exec -it fn-ruby bin/dev
```

open [the application](http://localhost:3000) and fill out the quiz.


To run the specs:

```shell
docker exec -it fn-ruby bundle exec rspec
```

Coverage expected is 100%:
![coverage.png](docs%2Fcoverage.png)

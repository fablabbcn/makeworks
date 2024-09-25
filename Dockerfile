FROM ruby:3.1.6
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev postgresql-client software-properties-common

SHELL ["/bin/bash", "--login", "-i", "-c"]

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash

RUN mkdir /app

COPY .nvmrc /app/.nvmrc

WORKDIR /app

SHELL ["/bin/bash", "--login", "-c"]

RUN nvm install

SHELL ["/bin/bash", "--login", "-c"]

RUN npm install -g yarn

COPY .ruby-version /app/.ruby-version
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

RUN bundle install

CMD ["rails", "server", "-b", "0.0.0.0"]

FROM ruby:2.7.6
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev postgresql-client software-properties-common

RUN curl -sL https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add -

RUN add-apt-repository "deb https://deb.nodesource.com/node_14.x $(lsb_release -sc) main"

RUN apt-get update -qq && apt-get install -y nodejs

RUN npm install -g yarn

RUN mkdir /app

WORKDIR /app

COPY .ruby-version /app/.ruby-version
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

RUN bundle install

CMD ["rails", "server", "-b", "0.0.0.0"]

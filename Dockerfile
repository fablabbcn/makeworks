FROM ruby:2.7.6
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs postgresql-client
RUN mkdir /app
WORKDIR /app
copy .ruby-version /app/.ruby-version
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install
CMD ["rails", "server", "-b", "0.0.0.0"]

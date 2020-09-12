FROM ruby:2.7.0
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs cmake postgresql
RUN mkdir -p /tmp/mini_blog
WORKDIR /tmp/mini_blog
ADD Gemfile /tmp/mini_blog/Gemfile
ADD Gemfile.lock /tmp/mini_blog/Gemfile.lock
RUN bundle install
RUN mkdir -p /mini_blog
WORKDIR /mini_blog

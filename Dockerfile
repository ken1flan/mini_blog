FROM ruby:2.7.0
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs cmake postgresql
RUN mkdir /mini_blog
WORKDIR /mini_blog
ADD Gemfile /mini_blog/Gemfile
ADD Gemfile.lock /mini_blog/Gemfile.lock
RUN bundle install
ADD . /mini_blog

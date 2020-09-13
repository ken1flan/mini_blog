FROM circleci/ruby:2.7.0-node-browsers
RUN sudo apt-get update -qq && sudo apt-get install -y cmake
RUN mkdir -p /tmp/mini_blog
WORKDIR /tmp/mini_blog
ADD Gemfile /tmp/mini_blog/Gemfile
ADD Gemfile.lock /tmp/mini_blog/Gemfile.lock
RUN bundle install
RUN sudo mkdir -p /mini_blog
WORKDIR /mini_blog

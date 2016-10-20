FROM ruby:2.3.1
MAINTAINER Vasily Kolesnikov re.vkolesnikov@gmail.com

ENV APP_HOME /root/blog

RUN apt-get update -qq && \
    apt-get install -y nodejs

RUN gem update --system && \
    gem update bundler

RUN mkdir $APP_HOME
WORKDIR $APP_HOME

COPY Gemfile* $APP_HOME/
RUN bundle install -j 20

USER root
CMD bash

FROM ruby:2.5.3
MAINTAINER Dan Harper <dan@kingdomsolutions.com.au>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y

RUN apt-get upgrade -y

WORKDIR /app
ADD Gemfile /app/
ADD Gemfile.lock /app/
RUN bundle install --jobs 8 --retry 3
ADD . /app/

CMD ruby ./bin/run

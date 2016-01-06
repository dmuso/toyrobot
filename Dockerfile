FROM ruby:2.2.3
MAINTAINER Dan Harper <dan@kingdomsolutions.com.au>

WORKDIR /app
ADD Gemfile /app/
ADD Gemfile.lock /app/
RUN bundle install --jobs 8 --retry 3
ADD . /app/

CMD ruby ./bin/run

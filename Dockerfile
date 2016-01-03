# Mostly from https://github.com/docker-library/rails/blob/9fb5d2b7e0f2e7029855028e07e86ab7ec54abaa/onbuild/Dockerfile
# except for them
# * ruby version (2.2 -> latest)
# * no mysql/postgres
# * build mine and run

#FROM ruby:2.2
FROM ruby:latest

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

ONBUILD COPY Gemfile /usr/src/app/
ONBUILD COPY Gemfile.lock /usr/src/app/
ONBUILD RUN bundle install

ONBUILD COPY . /usr/src/app

RUN apt-get update && apt-get install -y nodejs --no-install-recommends && rm -rf /var/lib/apt/lists/*
#RUN apt-get update && apt-get install -y mysql-client postgresql-client sqlite3 --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN apt-get update && apt-get install -y sqlite3 --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN git clone https://github.com/ujihisa/one-time-realtime-chat.git && cd one-time-realtime-chat && bundle --deployment && rake db:migrate

EXPOSE 3000 28080
# CMD ["rails", "server", "-b", "0.0.0.0"]
CMD ["sh", "-c", "cd one-time-realtime-chat && rails server -b 0.0.0.0"]

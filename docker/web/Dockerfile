FROM ruby:3.1.2

ENV LANG C.UTF-8
ENV APP_ROOT /portfolio01-app
ENV BUNDLE_JOBS 4
ENV BUNDLER_VERSION 2.3.25

WORKDIR $APP_ROOT

COPY Gemfile $APP_ROOT/Gemfile
COPY Gemfile.lock $APP_ROOT/Gemfile.lock

RUN gem install bundler -v $BUNDLER_VERSION
RUN bundle -v
RUN bundle install

COPY . $APP_ROOT

RUN mkdir -p tmp/sockets
RUN mkdir -p tmp/pids

# add a script to be executed every time the container starts.
COPY ./docker/web/entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT [ "entrypoint.sh"]

EXPOSE 3000

# 起動の度にデフォルトでrails sする(entrypoint.sh)に持たせても良い
CMD ["rails", "server", "-b", "0.0.0.0"]
# N.B.: this must match the Ruby version in the Gemfile, and /.ruby-version.
FROM ruby:2.6.2

ENV RAILS_ENV=production
ENV RAILS_LOG_TO_STDOUT=true
ENV RAILS_SERVE_STATIC_FILES=true

RUN mkdir app
WORKDIR app

# Copy the Gemfile as well as the Gemfile.lock and install gems.
# This is a separate step so the dependencies will be cached.
COPY Gemfile Gemfile.lock ./
RUN gem install bundler && bundle install --without development test --jobs 20 --retry 5

# Copy the main application, except whatever is listed in .dockerignore.
COPY . ./

RUN bin/rails assets:precompile

EXPOSE 3000

# This is the web server entry point. It will need to be overridden when
# running the workers.
ENTRYPOINT ["bin/rails", "server", "-b", "0.0.0.0"]

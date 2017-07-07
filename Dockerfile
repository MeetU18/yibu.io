FROM rails:5

# update bundler version
RUN gem install bundler

# install gems
WORKDIR /app
ADD Gemfile /app
ADD Gemfile.lock /app
RUN bundle install

# add app directory
ADD . /app

ENV RAILS_ENV production

# puma config
ENV RAILS_MAX_THREADS 5
ENV WEB_CONCURRENCY 1
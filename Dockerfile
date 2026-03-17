ARG RUBY_VERSION

FROM ruby:${RUBY_VERSION}-alpine

WORKDIR /app

# Install packages needed for building gems and running the application
# Use 'apk add --no-cache' for Alpine package management
# 'build-base' is Alpine's equivalent to Debian's 'build-essential'
RUN apk add --update --no-cache \
    build-base \
    tzdata \
    libxml2-dev \
    libxslt-dev \
    yaml-dev

COPY Gemfile* ./

RUN bundle install --jobs 4 --retry 3

COPY . ./

RUN chmod +x docker-entrypoint.sh
ENTRYPOINT ["./docker-entrypoint.sh"]
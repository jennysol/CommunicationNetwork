FROM ruby:3.0.1-slim

# Install dependencies
# RUN echo 'deb http://deb.debian.org/debian stretch-backports main' > /etc/apt/sources.list.d/backports.list
RUN apt-get update -qq; \
    apt-get install -y build-essential \
                       libpq-dev;

# Setup Workdir
RUN mkdir /communication_network
WORKDIR /communication_network

ENV RAILS_ENV=production
ENV RAILS_LOG_TO_STDOUT=true
ENV PORT=80

# Cache gems
COPY Gemfile /communication_network/Gemfile
COPY Gemfile.lock /communication_network/Gemfile.lock

# Install gems
RUN bundle install --without development test
COPY . /communication_network

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
# EXPOSE 80 443

# Container health check
# HEALTHCHECK --start-period=200s CMD curl --fail http://localhost/health_check || exit 1     

# Start the main process.
COPY start_script.sh ./start_script.sh
RUN chmod +x ./start_script.sh
CMD ./start_script.sh
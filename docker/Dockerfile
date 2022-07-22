FROM ruby:3.1.2

# Timezone configuration
RUN echo "Africa/Addis_Ababa" > /etc/timezone
RUN dpkg-reconfigure -f noninteractive tzdata

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client cmake
RUN mkdir /opt/app
WORKDIR /opt/app

COPY ./Gemfile ./Gemfile.lock ./

#RUN bundle config set --local without 'development test'
# RUN bundle install --jobs 20 --retry 5
RUN bundle install

COPY . .

EXPOSE 3000

# CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]

FROM ruby:2.0
MAINTAINER  Piotr Murach

#Set workdir
WORKDIR /app

#Add gcli
ADD / /app

#Install Deps
RUN [ "gem", "install", "bundler" ]
RUN [ "bundle", "install", "--standalone" ]

#Set gcli as ENTRYPOINT
ENTRYPOINT [ "ruby", "/app/bin/gcli" ]

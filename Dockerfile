#################################################################
# This docker image build file creates an image that contains
# nginx, passenger, rvm with ruby on rails. It is intended for you
# to use as a base for your project. Or as a template for your dockerfile.
#
#                    ##        .
#              ## ## ##       ==
#           ## ## ## ##      ===
#       /""""""""""""""""\___/ ===
#  ~~~ {~~ ~~~~ ~~~ ~~~~ ~~ ~ /  ===- ~~~
#       \______ o          __/
#         \    \        __/
#          \____\______/
#
# Component:    nginx php mysql redis mongo ruby elasticsearch 
# Author:       lavender <lavendergeng@gmail.com>
#################################################################

#####
# Building: sudo docker build -t localhost:5000/webapp .
# Open it up: sudo docker run -t -i -p 80:80 -p 443:443 -p 4000:22 bash -l

FROM localhost:5000/ubuntu:latest
MAINTAINER lavender <lavendergeng@gmail.com>

RUN apt-get update \
 && apt-get install -y mysql-server \
 && rm -rf /var/lib/mysql/mysql \
 && rm -rf /var/lib/apt/lists/*

ADD startmysql /startmysql
RUN chmod 755 /startmysql

EXPOSE 3306

VOLUME ["/var/lib/mysql"]
VOLUME ["/run/mysqld"]

CMD ["/startmysql"]

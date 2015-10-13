FROM debian:jessie 
MAINTAINER Manuel Pineda <manuel.felipe.pineda@gmail.com>

RUN echo "deb http://ftp.us.debian.org/debian/ testing main contrib non-free" >> /etc/apt/sources.list
RUN echo "deb-src http://ftp.us.debian.org/debian/ testing main contrib non-free" >> /etc/apt/sources.list

RUN apt-get update 
RUN apt-get install -y aptitude vim
RUN aptitude install -y wget build-essential python

WORKDIR /home

RUN wget https://nodejs.org/dist/v4.2.0/node-v4.2.0.tar.gz
RUN tar xf node-v4.2.0.tar.gz

WORKDIR /home/node-v4.2.0
RUN ./configure
RUN make 
RUN make install

WORKDIR /

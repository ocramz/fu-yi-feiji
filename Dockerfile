FROM ubuntu:12.04

MAINTAINER Marco Zocca

RUN apt-get update
RUN apt-get install -y apt-transport-https ca-certificates

RUN apt-get install -y sudo wget curl

RUN sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D


RUN rm /etc/apt/sources.list.d/docker.list

RUN echo "deb https://apt.dockerproject.org/repo ubuntu-precise main" >> /etc/apt/sources.list.d/docker.list
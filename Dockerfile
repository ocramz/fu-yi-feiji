FROM ubuntu:12.04

MAINTAINER Marco Zocca

RUN apt-get update
RUN apt-get install -y apt-transport-https ca-certificates

RUN apt-get install -y sudo wget curl

# # # Update APT sources

RUN sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

RUN echo "deb https://apt.dockerproject.org/repo ubuntu-precise main" >> /etc/apt/sources.list.d/docker.list

RUN apt-get update
# Purge the old repo if it exists.

RUN apt-get purge lxc-docker
# Verify that APT is pulling from the right repository.

RUN apt-cache policy docker-engine


# # # 

RUN sudo apt-get update
#Install both the required and optional packages.

RUN sudo apt-get install -y linux-image-generic-lts-trusty


# # # 

RUN sudo apt-get update
# Install Docker.

RUN sudo apt-get install docker-engine
# Start the docker daemon.

RUN sudo service docker start
Verify docker is installed correctly.

RUN sudo docker run hello-world
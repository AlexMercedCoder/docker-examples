## Starting from Ubuntu
FROM ubuntu

## Create a Non-Root User
RUN apt-get update && apt-get -y install sudo && apt-get install wget -y && apt-get install curl -y
RUN useradd -m docker && echo "docker:docker" | chpasswd && adduser docker sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

EXPOSE 5000 

## Switch to Non-Root User
USER docker

## Install Python 2 and Pip/Pip3
RUN sudo apt-get update && sudo apt-get install python3 python3-dev -y
RUN sudo apt-get install python pip -y

## Set Home to Workdir
WORKDIR /home/docker/

## Start Container
ENTRYPOINT bash
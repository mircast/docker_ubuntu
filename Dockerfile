FROM ubuntu
ENV password "password"
ENV rootPassword "password"
ENV user "user"
# ADD . /tests
# WORKDIR /tests
# COPY /tests/* /tests
RUN apt-get update
RUN apt-get install -y wget
RUN apt-get install -y curl
RUN apt-get install -y sudo
RUN apt-get install -y gnupg2
RUN apt-get install -y net-tools
RUN apt-get install -y nano
RUN apt-get install -y ssh
RUN apt-get install -y iputils-ping 
RUN apt-get install -y iproute2
RUN useradd -ms /bin/bash ${user}
RUN echo root:${password} | chpasswd
RUN echo ${user}:${password} | chpasswd
ENTRYPOINT service ssh restart && bash

EXPOSE 22


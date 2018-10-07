FROM ubuntu

LABEL key="Matheus Lima <mathalexandre.lima@gmail.com>" 

RUN apt-get update -y && apt-get upgrade -y

# System basics 
RUN apt-get install dialog apt-utils -y
RUN apt-get install -y tar
RUN apt-get install -y net-tools
RUN apt-get install -y wget  
RUN apt-get install sudo
RUN apt-get install -y software-properties-common

# RUN apk --update add --no-cache     

# User Configs
RUN adduser --disabled-password --gecos '' docker
RUN adduser docker sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
USER docker

# JAVA 10
RUN sudo wget https://download.java.net/java/GA/jdk10/10.0.2/19aef61b38124481863b1413dce1855f/13/openjdk-10.0.2_linux-x64_bin.tar.gz
RUN sudo mkdir /usr/java
RUN sudo mv openjdk-10.0.2_linux-x64_bin.tar.gz /usr/java/
WORKDIR /usr/java/ 
RUN sudo tar zxvf openjdk-10.0.2_linux-x64_bin.tar.gz
RUN sudo rm openjdk-10.0.2_linux-x64_bin.tar.gz

ENV JAVA_HOME=/usr/java/jdk-10.0.2
ENV PATH=${PATH}:${JAVA_HOME}/bin

WORKDIR /home/docker

# ECLIPSE (PHOTON)
RUN sudo wget -c http://eclipse.c3sl.ufpr.br/technology/epp/downloads/release/photon/R/eclipse-jee-photon-R-linux-gtk-x86_64.tar.gz -O eclipse.tar.gz
RUN sudo tar -zxvf eclipse.tar.gz -C /opt/
ENV ECLIPSE_HOME=/opt/eclipse
ENV PATH=${PATH}:${ECLIPSE_HOME}

# ECLIPSE - Libs gráficas
RUN sudo apt-get install -y libxslt1.1 libswt-gtk-3-jni libswt-gtk-3-java
RUN sudo apt install libcanberra-gtk-module libcanberra-gtk3-module -y
RUN sudo apt-get autoremove -y
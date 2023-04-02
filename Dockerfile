# syntax=docker/dockerfile:1
FROM alpine:latest

## General installation of dependencies
RUN apk update 
RUN apk add \
git \
python3 \
py3-pip gcc \
python3-dev \
postgresql-dev \
libffi-dev \
musl-dev \
libxml2-dev \
libxslt-dev

## Installation of nslookup, dig, host, nmap
RUN apk add bind-tools
RUN apk add nmap
RUN apk add nmap-scripts
RUN rm -rf /var/cache/apk/*

## Installation of sublist3r
WORKDIR /root
RUN git clone https://github.com/aboul3la/Sublist3r.git
WORKDIR /root/Sublist3r
RUN pip install -r requirements.txt

## Installation of finalrecon
WORKDIR /root
RUN git clone https://github.com/thewhiteh4t/finalrecon.git
WORKDIR /root/finalrecon/
RUN pip3 install wheel
RUN pip3 install --upgrade pip
RUN pip3 install -r requirements.txt

## Installation of Nikto
WORKDIR /root
RUN apk add perl
RUN git clone https://github.com/sullo/nikto
WORKDIR /root/nikto/program


## Setting variables and running commands
## Target to be set via AWS interface, specified in SSM parameter store
WORKDIR /
ENV nmap_target="example.com"
COPY . /
CMD /bin/sh ./scan.sh

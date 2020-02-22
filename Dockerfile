FROM golang:latest 

RUN apt-get update
RUN apt-get -y upgrade

RUN apt-get -y install git-core curl build-essential openssl libssl-dev \
 && git clone https://github.com/nodejs/node.git \
 && cd node \
 && ./configure \
 && make \
 && sudo make install

RUN apt-get -y install go-dep
RUN apt-get -y install make

RUN npm install -g serverless

RUN go get github.com/aws/aws-lambda-go


FROM golang:1.13.8-stretch

ENV SERVERLESS serverless@1.63.0
ENV GOPATH /go
ENV PATH $GOPATH/bin:/root/.yarn/bin:$PATH

RUN mkdir /.cache && \
    mkdir /.cache/go-build
RUN apt-get update && \
    apt-get install git
RUN	go get -u github.com/rancher/trash
RUN curl --silent --location https://deb.nodesource.com/setup_6.x | bash - && \
    apt-get install -y nodejs
RUN curl -o- -L https://yarnpkg.com/install.sh | bash
RUN npm install -g $SERVERLESS

RUN apt-get -y install go-dep
RUN apt-get -y install make

RUN go get github.com/aws/aws-lambda-go



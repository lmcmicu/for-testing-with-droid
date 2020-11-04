#FROM debian:buster
#RUN apt-get -y update && apt-get -y install make python3 git vim
FROM alpine:latest
RUN apk add --no-cache make git

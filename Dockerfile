#FROM debian:buster
#RUN apt-get -y update && apt-get -y install make python3 git vim
FROM alpine:latest
RUN echo "sleeping 60" && sleep 60 && apk add --no-cache make git

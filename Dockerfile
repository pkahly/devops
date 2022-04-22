FROM alpine

# install java
RUN apk --update-cache add openjdk11

WORKDIR /app
COPY . /app
#!/bin/sh

docker run -d -p 8080:8090 --name=confluence andypowe11:ubuntu-confluence
docker ps | grep confluence

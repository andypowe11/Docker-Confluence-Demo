#!/bin/sh

cd ubuntu-base && \
  docker build -t andypowe11:ubuntu-base . && \
  cd ..
cd ubuntu-java8 && \
  docker build -t andypowe11:ubuntu-java8 . && \
  cd ..
cd ubuntu-confluence && \
  docker build -t andypowe11:ubuntu-confluence . && \
  cd ..

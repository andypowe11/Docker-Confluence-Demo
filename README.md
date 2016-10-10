# Docker Confluence Demo

Build and run a Docker container containing a demo copy of the Atlassian Confluence colaboration platform. You'll need to get a licence from Atlassian to do anything with this.

Mostly taken from https://blog.docker.com/2016/10/dockerizing-confluence/ but without the Puppet bits.

## Usage

Build the images with

    ./build.sh

Then deploy the ubuntu-confluence container with

    ./start.sh

Then browse to http://localhost:8080/ and plug in your licence.

Stop and remove the container with

    ./stop.sh

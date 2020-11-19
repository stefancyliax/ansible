#!/bin/bash
echo "DPATH=$(which docker)" > .env
echo "DCPATH=$(which docker-compose)" >> .env
echo "GID=$(stat -c '%g' /var/run/docker.sock)" >> .env
echo "IDJENKINSUSER=$(id -u jenkins)" >> .env
echo "IDJENKINSGROUP=$(id -g jenkins)" >> .env

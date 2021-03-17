#!/bin/bash

sudo docker container rm geodummy
sudo docker build -t "geodummy" .
sudo docker run --name geodummy -v /var/docker_volumes/geodummy/storage:/var/storage -p 5000:5000 geodummy

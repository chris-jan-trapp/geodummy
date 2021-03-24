#!/bin/bash

sudo docker stop geodummy
sudo docker container rm geodummy
cd /opt/geodummy
git pull
sudo docker build -t "geodummy" .
sudo cp /var/docker_volumes/geodummy/storage/database.json /var/docker_volumes/geodummy/storage/database.json.bak
sudo docker run -d --name geodummy -v /var/docker_volumes/geodummy/storage:/var/storage -p 5000:5000 geodummy

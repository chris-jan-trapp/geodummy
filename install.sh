#!/bin/bash

install_dir=/opt/geodummy
sudo mkdir -p $install_dir
sudo chmod o+w $install_dir

cd $install_dir
git clone https://github.com/chris-jan-trapp/geodummy.git .

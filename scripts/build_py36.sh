#!/bin/bash
sudo apt-get update
sudo apt-get install -y build-essential
sudo apt-get install -y libssl-dev zlib1g-dev libncurses5-dev libncursesw5-dev libreadline-dev libsqlite3-dev
sudo apt-get install -y libgdbm-dev libdb5.3-dev libbz2-dev libexpat1-dev liblzma-dev tk-dev
wget https://www.python.org/ftp/python/3.6.7/Python-3.6.7rc1.tgz
tar -xvf Python-3.6.7rc1.tgz 
cd Python-3.6.7rc1/
./configure --enable-optimizations
make -j
sudo make install

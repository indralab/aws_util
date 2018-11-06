#!/bin/bash
mkdir /data/virtualenvs
sudo pip3 install virtualenvwrapper
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
export WORKON_HOME=/data/virtualenvs/
source /usr/local/bin/virtualenvwrapper.sh
mkvirtualenv --python=/usr/local/bin/python3 py36
# NOTE: it makes sense to add lines 4-6 to your ~/.bashrc to have the
# virtualenvs set up at login

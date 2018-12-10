#!/bin/bash
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install -y oracle-java8-installer
sudo apt install oracle-java8-set-default
export JAVA_HOME="/usr/lib/jvm/java-8-oracle/"

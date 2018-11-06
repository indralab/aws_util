#/bin/bash
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install -y docker-ce
sudo usermod -aG docker ${USER}
#NOTE: one actually has to log out and in again for this to take effect
# Optionally, one can have ddocker make images in a custom location
# To do this, /lib/systemd/system/docker.service, and and add the -g option
# to this line:
# ExecStart=/usr/bin/dockerd -g /pmc/docker -H fd://
# then do
# sudo systemctl daemon-reload
# sudo service docker restart


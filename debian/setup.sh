#install node.js
sudo apt-get update
sudo apt-get install git-core curl build-essential openssl libssl-dev python
git clone https://github.com/nodejs/node.git
cd node
./configure
make
sudo make install

#install npm
curl -L https://npmjs.org/install.sh | sudo zsh

#install thefuck
sudo apt update
sudo apt install python3-dev python3-pip python3-setuptools
sudo pip3 install thefuck

#install cowsay
sudo apt-get update -y
sudo apt-get install -y cowsay
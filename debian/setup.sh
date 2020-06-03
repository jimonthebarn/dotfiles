#install node.js: do manually if required (compiling takes ages)
#sudo apt-get update
#sudo apt-get install git-core curl build-essential openssl libssl-dev python
#git clone https://github.com/nodejs/node.git
#cd node
#./configure
#make
#sudo make install

#install npm
curl -L https://npmjs.org/install.sh | sudo zsh

#install thefuck
sudo apt update
sudo apt install python3-dev python3-pip python3-setuptools
sudo pip3 install thefuck

#install cowsay
sudo apt-get update -y
sudo apt-get install -y cowsay

#install pyenv
sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev \
libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
xz-utils tk-dev libffi-dev liblzma-dev
curl -L https://raw.githubusercontent.com/pyenv/pyenv-installer/master/bin/pyenv-installer | zsh

#install lolcat
apt-get install ruby
wget https://github.com/busyloop/lolcat/archive/master.zip
unzip master.zip
cd lolcat-master/bin
gem install lolcat
#sudo snap install lolcat #if WSL supported snapd
#!/bin/sh
set -e
set -x

apt-get update
apt-get install -y -qq ant
apt-get install -y -qq bash
apt-get install -y -qq default-jdk
apt-get install -y -qq git
apt-get install -y -qq vim
apt-get install -y -qq wget

rm /usr/bin/vi
ln -s /usr/bin/vim /usr/bin/vi

git_dir=~/Development/git
mkdir -p $git_dir
cd $git_dir

git clone https://github.com/eriklievaart/ant.git
git clone https://github.com/eriklievaart/ws.git

buildfile=$git_dir/ant/master.xml
ant -f "$buildfile" -Dproject.name=ws master-jar-deploy       -Dskip.test=true -Dskip.checkstyle=true -Dskip.resolve=true -Dskip.test.compile=true -Dskip.preprocess=true

rm -rf ~/Development
mkdir ~/Development
mkdir -p /vol/git
ln -s /vol/git ~/Development/git

rm $0


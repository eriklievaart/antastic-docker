#!/bin/sh
set -e
set -x

apk add openjdk11 fontconfig ttf-dejavu
apk add apache-ant
apk add git

git_dir=~/Development/git
ws_dir=~/.cache/ws
mkdir -p $git_dir
mkdir -p $ws_dir

cd $git_dir
git clone https://github.com/eriklievaart/ant.git
git clone https://github.com/eriklievaart/toolkit.git
git clone https://github.com/eriklievaart/ws.git

buildfile=$git_dir/ant/master.xml
ant -f "$buildfile" -Dproject.name=toolkit master-install master-osgi-install
ant -f "$buildfile" -Dproject.name=ws master-jar-deploy
cp ~/Applications/ws/ws.jar /root/.cache/ws

rm -rf ~/Development/*
rm $0


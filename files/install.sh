#!/bin/sh
set -e
set -x

apk add openjdk11 fontconfig ttf-dejavu
apk add apache-ant
apk add git

git_dir=~/Development/git
ws_dir=~/.cache/ws
buildfile=$git_dir/ant/master.xml

mkdir -p $git_dir
mkdir -p $ws_dir

cd $git_dir
git clone https://github.com/eriklievaart/ant.git
git clone https://github.com/eriklievaart/ws.git
ant -f "$buildfile" -Dproject.name=ws -Dskip.resolve=true -Dskip.test.compile=true -Dskip.test=true -Dskip.preprocess=true master-jar-deploy

rm -rf ~/Development/* /tmp/build /tmp/sandbox
rm $0


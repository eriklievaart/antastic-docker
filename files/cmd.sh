#!/bin/sh
set -e

die() {
	echo >&2 "$@"
	exit 1
}

git_dir=/vol/git
buildfile="/vol/git/ant/master.xml"

[ "$#" -gt 0 ]    || die "missing argument: [project]..."
[ -d "$git_dir" ] || die "missing volume: $git_dir"
ln -s $git_dir ~/Development/git

success=0
while [ "$#" -gt 0 ]
do
	project=$1
	shift
	
	properties=$git_dir/$project/main/config/ant.properties
	for target in $(cat $properties | sed -r -n '/^target=/{s/[^=]+=//;s/[, ]+/ /;p}')
	do
		echo
		echo '######################################################################'
		echo "# building $project $target"
		echo '######################################################################'
		echo
		ant -f "$buildfile" -Dproject.name=$project $target || die "build project $project failed!"
	done
done





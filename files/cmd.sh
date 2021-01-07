#!/bin/dash
set -e

die() {
	echo >&2 "$@"
	exit 1
}

[ "$#" -gt 0 ] || die "missing argument: [project]..."
buildfile="/vol/git/ant/master.xml"

success=0
while [ "$#" -gt 0 ]
do
	project=$1
	shift
	
	properties=$HOME/Development/git/$project/main/config/ant.properties
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




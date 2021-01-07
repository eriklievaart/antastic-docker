
antastic
========

A ubuntu based docker image for running antastic

usage
-----

to run the image:

`docker run lievaart/antastic`

directories you may want to mount as a volume
* /vol/git = git repositories (/vol/git/ant contains the antastic build scripts, other repos contain projects)
* /root/Applications = where applications are deployed by default
* /root/Development/repo = where jar files are downloaded / created

references
----------

git repository

https://github.com/eriklievaart/antastic-docker

alpine docker:

https://hub.docker.com/_/alpine/




from lievaart/alpine

#run apk add openjdk11 fontconfig ttf-dejavu apache-ant git

copy files /root/
run /root/install.sh

entrypoint [ "/root/cmd.sh" ]


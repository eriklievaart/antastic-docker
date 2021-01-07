
from lievaart/alpine

copy files /root/
run /root/install.sh

entrypoint [ "/root/cmd.sh" ]


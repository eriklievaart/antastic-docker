
from ubuntu

copy files /root/
run ls /root
run /root/install.sh

entrypoint [ "/root/cmd.sh" ]


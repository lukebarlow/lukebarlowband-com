#!/bin/bash

if [[ ! -f /root/bin/ecpp ]]; then
        wget -q http://toolbox.hostgator.com/toolbox/ecpp -O /root/bin/ecpp &>/dev/null
        chmod +x /root/bin/ecpp
else
        REMOTE_MD5=$(GET http://toolbox.hostgator.com/toolbox/ecpp | md5sum | awk '{print $1}');
        LOCAL_MD5=$(md5sum /root/bin/ecpp | awk '{print $1}');
        if [ "${LOCAL_MD5}" != "${REMOTE_MD5}" ]; then
                echo "Checksum changed, updating.";
                wget -q http://toolbox.hostgator.com/toolbox/ecpp -O /root/bin/ecpp &>/dev/null
                chmod +x /root/bin/ecpp
        fi;
fi;

/usr/bin/perl /root/bin/ecpp $@

#!/bin/bash -e
echo "downloading $kit and $icmkit" > getkits.log
if [ -z "$WRC_PASSWORD" ]; then
    echo "WRC_PASSWORD is Empty. Quitting." >> getkits.log
    exit
fi
wget -qO /dev/null --keep-session-cookies --save-cookies cookie --post-data="UserName=$WRC_USERNAME&Password=$WRC_PASSWORD" 'https://login.intersystems.com/login/SSO.UI.Login.cls?referrer=https%253A//wrc.intersystems.com/wrc/login.csp' 
wget --secure-protocol=TLSv1_2 -O $kit --load-cookies cookie "https://wrc.intersystems.com/wrc/WRC.StreamServer.cls?FILE=/wrc/Live/ServerKits/$kit"
wget --secure-protocol=TLSv1_2 -O $icmkit --load-cookies cookie "https://wrc.intersystems.com/wrc/WRC.StreamServer.cls?FILE=/wrc/Live/Containers/$icmkit"
rm -f cookie
exit


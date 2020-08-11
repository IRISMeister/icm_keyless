#!/bin/bash -e
export WRC_USERNAME='xxx''
export WRC_PASSWORD='xxx'
export kit='IRIS-2020.1.0.215.0-lnxubuntux64.tar.gz'
export icmkit='icm-2020.1.0.215.0-docker.tar.gz'

wget -qO /dev/null --keep-session-cookies --save-cookies cookie --post-data="UserName=$WRC_USERNAME&Password=$WRC_PASSWORD" 'https://login.intersystems.com/login/SSO.UI.Login.cls?referrer=https%253A//wrc.intersystems.com/wrc/login.csp' 
wget --secure-protocol=TLSv1_2 -O $kit --load-cookies cookie "https://wrc.intersystems.com/wrc/WRC.StreamServer.cls?FILE=/wrc/Live/ServerKits/$kit"
wget --secure-protocol=TLSv1_2 -O $icmkit --load-cookies cookie "https://wrc.intersystems.com/wrc/WRC.StreamServer.cls?FILE=/wrc/Live/Containers/$icmkit"
exit


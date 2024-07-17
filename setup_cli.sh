#!/bin/bash

pkg update -y

pkg install openjdk-17 -y

pkg install wget -y

mkdir viaproxy && cd viaproxy

wget https://github.com/ViaVersion/ViaProxy/releases/download/v3.3.1/ViaProxy-3.3.1.jar

cp ViaProxy-3.3.1.jar viaproxy.jar

clear

dos2unix vp.sh

chmod +x vp.sh

clear

./vp.sh


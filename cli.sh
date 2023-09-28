#!/bin/bash

pkg update -y

pkg install openjdk-17 -y

pkg install wget -y

mkdir viaproxy && cd viaproxy

wget https://github.com/ViaVersion/ViaProxy/releases/download/v3.0.21/ViaProxy-3.0.21.jar

clear

dos2unix vp.sh

chmod +x vp.sh

clear

./vp.sh


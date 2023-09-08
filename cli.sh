#!/bin/bash

pkg update -y

pkg install openjdk-17 -y

pkg install wget -y

mkdir viaproxy && cd viaproxy

wget https://github.com/ViaVersion/ViaProxy/releases/download/v3.0.20/ViaProxy-3.0.20.jar

clear

wget https://raw.githubusercontent.com/CoffezimJs/viaproxy-termux-tool/main/vp.sh

dos2unix vp.sh

clear

./vp.sh


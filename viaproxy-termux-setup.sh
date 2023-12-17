#!/bin/bash

# Atualiza os pacotes e instala o que é necessário
pkg update -y 
pkg install wget openjdk-17 
pkg install x11-repo -y && pkg install tigervnc -y && pkg install fluxbox -y

# Cria o diretório e baixa o arquivo ViaProxy
mkdir viaproxy 
cd viaproxy
wget https://github.com/ViaVersion/ViaProxy/releases/download/v3.0.23/ViaProxy-3.0.23.jar

# Abre o arquivo xstartup no nano
nano ~/.vnc/xstartup <<EOF
#!/data/data/com.termux/files/usr/bin/sh

# Fluxbox desktop.
Generate menu.
fluxbox-generate_menu

# Inicia o fluxbox.
fluxbox &
EOF

# After exiting nano, execute the commands
cd \$HOME/Viaproxy
vncserver -localhost
export DISPLAY=:0
fluxbox &
echo Next, execute: java -jar ViaProxy
echo execute vncpasswd password

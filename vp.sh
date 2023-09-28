#!/bin/bash

echo "Enter the target IP:"
read target_ip

echo "Enter the target port:"
read target_port

echo "Enter the version:"
read version

echo "Use legacy passthrough? Y/n"
read use_legacy

echo "Use online mode? Y/n"
read use_online_mode

java_command="java -jar ViaProxy-3.0.21.jar --bind_port 25568 --target_ip $target_ip --target_port $target_port --version $version"

if [ "$use_legacy" == "Y" ] || [ "$use_legacy" == "y" ]; then
    java_command="$java_command --legacy_passthrough"
fi

if [ "$use_online_mode" == "Y" ] || [ "$use_online_mode" == "y" ]; then
    java_command="$java_command --online_mode"
fi

$java_command

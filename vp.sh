#!/bin/bash

echo "Enter the target IP and Port:"
read target_ip

echo "Enter the version:"
read version

echo "Use legacy passthrough? Y/n"
read use_legacy

echo "Use online mode? Y/n"
read use_online_mode

echo "Use authentication? Y/n"
read use_auth

java_command="java -jar ViaProxy-3.1.0.jar --bind_address 0.0.0.0:25568 --target_ip $target_ip --version $version"

if [ "$use_legacy" == "Y" ] || [ "$use_legacy" == "y" ]; then
    java_command="$java_command --legacy_passthrough"
fi

if [ "$use_online_mode" == "Y" ] || [ "$use_online_mode" == "y" ]; then
    java_command="$java_command --online_mode"
fi

if [ "$use_auth" == "Y" ] || [ "$use_auth" == "y" ]; then
    echo "Enter authentication value: Y/n"
    read auth_value

    if [ "$auth_value" == "Y" ] || [ "$auth_value" == "y" ]; then
        java_command="$java_command --oam_auth put _use auth y"
    else
        java_command="$java_command --oam_auth put _use auth n"
    fi
fi

$java_command

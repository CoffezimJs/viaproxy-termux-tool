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

java_command="java -jar viaproxy.jar cli --bind-address 0.0.0.0:25568 --target-address $target_ip --target-version $version"

if [ "$use_legacy" == "Y" ] || [ "$use_legacy" == "y" ]; then
    java_command="$java_command --allow-legacy-client-passthrough true"
fi

if [ "$use_online_mode" == "Y" ] || [ "$use_online_mode" == "y" ]; then
    java_command="$java_command --proxy-online-mode true"
fi

if [ "$use_auth" == "Y" ] || [ "$use_auth" == "y" ]; then
    echo "Enter authentication method (NONE, OAM, etc.):"
    read auth_method
    java_command="$java_command --auth-method $auth_method"
fi

$java_command

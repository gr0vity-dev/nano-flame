#!/bin/bash

# Check if two arguments are passed
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 [container_name] [duration]"
    exit 1
fi

nano_node_container_name=$1
duration=$2

# Detect the platform
platform=$(uname -m)
case $platform in
    x86_64)
        image_tag="amd64"
        ;;
    aarch64 | arm64)
        image_tag="arm64"
        ;;
    *)
        echo "Unsupported platform: $platform"
        exit 2
        ;;
esac

# Run the Docker command
docker run --rm --privileged --pid=container:${nano_node_container_name} -v $(pwd):/data gr0v1ty/nano_flame:${image_tag} ${duration} > /dev/null 2>&1

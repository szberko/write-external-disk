#!/bin/bash

NAME=$1
FS=$2
DF_COMMAND="df -Hl | grep $NAME | awk '{print \$1}'"
BLOCK_DEVICE_NAME=$(eval "$DF_COMMAND")
sudo diskutil unmount $BLOCK_DEVICE_NAME
sudo mkdir -p /Volumes/$NAME
echo "Creating dir: /Volumes/$NAME"
sudo mount_$FS $BLOCK_DEVICE_NAME /Volumes/$NAME
echo "mount_$FS on: /Volumes/$NAME"
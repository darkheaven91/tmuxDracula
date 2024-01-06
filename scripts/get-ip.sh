#!/bin/bash

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # Linux
    INTERFACE=$(ip route | head -n 1 | awk '/default/ {print $5}')
    IP=$(ip a show $INTERFACE | grep -m 1 inet | awk '{print $2}' | cut -d / -f 1)
elif [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS
    INTERFACE=$(route get default | grep interface | awk '{print $2}')
    IP=$(ifconfig $INTERFACE | awk '/inet / {print $2}')

echo "$INTERFACE : $IP"
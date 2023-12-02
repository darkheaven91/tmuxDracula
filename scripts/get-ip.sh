INTERFACE=$(ip route | awk '/default/ {print $5}')
ip a show $INTERFACE | grep -m 1 inet | awk '{print $2}' | cut -d / -f 1


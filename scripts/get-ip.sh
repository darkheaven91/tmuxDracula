INTERFACE=$(ip route | head -n 1 | awk '/default/ {print $5}')
IP=$(ip a show $INTERFACE | grep -m 1 inet | awk '{print $2}' | cut -d / -f 1)
echo "$INTERFACE : $IP"

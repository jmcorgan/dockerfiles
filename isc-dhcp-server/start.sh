#!/bin/sh

set -e
set -o nounset
#set -x # DEBUG

INIT=/usr/bin/dumb-init
DHCPD=/usr/sbin/dhcpd
DHCPD_DIR=/data

uid=$(stat -c%u "$DHCPD_DIR")
gid=$(stat -c%g "$DHCPD_DIR")

chown $uid:$gid $DHCPD
chown $uid:$gid $DHCPD_DIR/dhcpd.leases

echo "Starting dhcpd service..."
exec $INIT $DHCPD -4 -f -d --no-pid -cf "$DHCPD_DIR/dhcpd.conf" -lf "$DHCPD_DIR/dhcpd.leases" $DHCPD_IFACE

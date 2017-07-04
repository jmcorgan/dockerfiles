#!/bin/sh

set -e
set -o nounset
#set -x # DEBUG

CHOWN=/bin/chown
SQUID=/usr/sbin/squid

$CHOWN -R squid:squid /var/log/squid
$CHOWN -R squid:squid /var/cache/squid

echo "Initializing squid directories..."
"$SQUID" -z

echo "Starting squid service..."
dumb-init "$SQUID" -NYd 1

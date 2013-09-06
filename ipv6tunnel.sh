#!/bin/sh

# ipv6tunnel
# Copyright (c) 2012-2013 Roumen Damianoff - http://roumen.it/
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# For more information see <http://www.gnu.org/licenses/>.

### BEGIN INIT INFO
# Provides: ipv6tunnel
# Required-Start:
# Required-Stop:
# Should-Start:
# Should-Stop:
# Default-Start: 2 3 4 5
# Default-Stop: 0 1 6
# Short-Description: Start and stop ipv6tunnel
# Description: ipv6tunnel
### END INIT INFO

###############
# CONFIG VARS #
###############

# remote and local tunnel ips
REMOTE_IP = '123.45.67.89'
LOCAL_IP  = '87.65.43.21'

# local ipv6 addr (array)
IPV6[0]   = '2001:123:4f56:78a::1/64'
IPV6[1]   = '2001:123:4f56:78a::2/64'
IPV6[2]   = '2001:123:45fa::1/48'
IPV6[3]   = '2001:123:45fa::2/48'

###############
# CORE SCRIPT #
###############

case "$1" in
'start')

# check for ipv6 kernel module
#modprobe ipv6

# add ipv6 tunnel
ip tunnel add ipv6tunnel mode sit remote $REMOTE_IP local $LOCAL_IP ttl 255
ip link set ipv6tunnel up

# add ipv6 addresses
for i in $IPV6
do
   ip addr add $i dev ipv6tunnel
done

ip route add ::/0 dev ipv6tunnel
ip -f inet6 addr

;;

'stop')

# stop
ip route del ::/0 dev ipv6tunnel
ip link set ipv6tunnel down
ip tunnel del ipv6tunnel

;;

*)

echo "Usage: $0 { start | stop }"
;;

esac
exit 0
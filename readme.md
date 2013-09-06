# ipv6tunnel

A simple bash script for managing IPv6 over IPv4 tunnels.

## Installation

Copy ipv6tunnel in your ``/etc/init.d`` folder.

Set configuration variables for your tunnel ``nano ipv6tunnel.sh``.

Run as root ``update-rc.d ipv6tunnel.sh defaults``.

Now you can start the tunnel with ``service ipv6tunnel.sh start``.

And stop it with ``service ipv6tunnel.sh stop``.

## License
This program is free software under GNU General Public License version 3 (or later) by the Free Software Foundation.
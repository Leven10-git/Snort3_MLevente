#!/bin/sh

exec /root/install/snort3/bin/snort  -c /root/install/snort3/etc/snort/snort_custom_lua/snort.lua $@ -l /var/log/snort --plugin-path /usr/local/snort/extra --daq-dir /usr/local/lib/daq/ -k none


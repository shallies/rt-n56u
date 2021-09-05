#!/bin/sh
if [ -f "/etc/storage/post_system_time_changed.sh" ] ; then
/etc/storage/post_system_time_changed.sh $1
fi

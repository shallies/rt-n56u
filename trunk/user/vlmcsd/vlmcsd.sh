#!/bin/sh

func_start(){
	vlmcsd -l /tmp/kms.log
	logger -t "vlmcsd" "Start"
}

func_stop(){
	killall -q vlmcsd
	logger -t "vlmcsd" "Stop"
}

case "$1" in
start)
	func_start
	;;
stop)
	func_stop
	;;
restart)
	func_stop
	func_start
	;;
*)
	echo "Usage: $0 { start | stop | restart }"
	exit 1
	;;
esac

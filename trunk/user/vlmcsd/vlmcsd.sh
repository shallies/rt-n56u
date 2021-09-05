#!/bin/sh

func_start(){
ps|grep -i [v]lmcsd
if [ $? -ne 0 ] ; then
	count=60
	while [ $count -gt 0 ]; do
		if [ $(nvram get ntp_ready) = 1 ] ; then
			break
		fi
		count=$((count-1))
		sleep 5
	done

	vlmcsd -l /tmp/kms.log
	logger -t "vlmcsd" " 服务已启动"
else
	logger -t "vlmcsd" " 服务正在运行"
fi
}

func_stop(){
	killall -q vlmcsd
	logger -t "vlmcsd" " 服务已停止"
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

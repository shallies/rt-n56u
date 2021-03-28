#!/bin/sh

func_start(){
        #Check internet connection
        n=30
        while [ $n -gt 0 ]; do
                ping -c 1 -W 1 114.114.114.114 >/dev/null
                if [ $? = 0 ]; then
                        break;
                fi;
                n=$((n-1))
                sleep 1
        done

        #Synchronize clock
        ntpd -nq -p ntp1.aliyun.com
        if [ $? != 0 ]; then
                ntpd -nq -p ntp.aliyun.com
        fi

        vlmcsd -l /tmp/vlmcsd.log
        logger -st "vlmcsd" "Start"
}

func_stop(){
	killall -q vlmcsd
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

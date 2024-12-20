#!/bin/sh

led_off(){
	mtk_gpio -w 13 0
	mtk_gpio -w 14 1
	mtk_gpio -w 15 1
}

led_red(){
	led_off
	mtk_gpio -w 13 1
}

led_yellow(){
	led_off
	mtk_gpio -w 14 0
}

led_blue(){
	led_off
	mtk_gpio -w 15 0
}

case "$1" in
	red)
		led_red;;
	yellow)
		led_yellow;;
	blue)
		led_blue;;
	-OFF)
		led_off;;
	-ON)
		server_to_ping=`nvram get server_to_ping`
		if [ "$server_to_ping" = "" ]; then
			server_to_ping="8.8.8.8"
		fi
		ping -c 1 -W 1 $server_to_ping >/dev/null
		if [ $? = 0 ]; then
			led_blue
		else
			led_yellow
		fi;;
	*)
		echo "LED control utitlity"
		echo "Usage: $0 red | yellow | blue | -OFF | -ON  [message]"
		echo "red: Turn LED to red color"
		echo "yellow: Turn LED to yellow color"
		echo "blue: Turn LED to blue color"
		echo "-OFF: Turn LED off"
		echo "-ON: Turn LED on, blue if internet ready, otherwise yellow"
		echo "If message provided, log it to syslog"
		exit;;
esac

if [ $2 ]; then
	logger -t "指示灯" $2
fi

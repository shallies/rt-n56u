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
		ping -c 1 -W 1 114.114.114.114 >/dev/null
		if [ $? = 0 ]; then
			led_blue
		else
			led_yellow
		fi;;
	*)
		exit;;
esac

if [ $2 ]; then
	logger -t "指示灯" $2
fi

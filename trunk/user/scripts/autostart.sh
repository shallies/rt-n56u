#!/bin/sh
#nvram set ntp_ready=0
if [ $(nvram get sdns_enable) = 1 ] ; then
logger -t "自动启动" "正在启动SmartDns ..."
/usr/bin/smartdns.sh start
fi

if [ $(nvram get caddy_enable) = 1 ] ; then
logger -t "自动启动" "正在启动文件管理 ..."
/usr/bin/caddy.sh start
fi

#logger -t "自动启动" "正在检查Internet连接状态 ..."
#count=60
#while [ $count -gt 0 ]; do
#	ping -c 1 -W 1 114.114.114.114 >/dev/null
#	if [ $? = 0 ]; then
#		logger -t "自动启动" "Internet已连接，正在同步时钟 ..."
#		ntpd -nq -p 120.25.115.20  #ntp1.aliyun.com
#		if [ $? != 0 ]; then
#			ntpd -nq -p 203.107.6.88  #ntp2.aliyun.com
#		fi
#		break;
#	fi;
#	count=$((count-1))
#	sleep 1
#done


if [ $(nvram get adbyby_enable) = 1 ] ; then
logger -t "自动启动" "正在启动 adbyby plus+ ..."
/usr/bin/adbyby.sh start
fi

if [ $(nvram get koolproxy_enable) = 1 ] ; then
logger -t "自动启动" "正在启动 koolproxy ..."
/usr/bin/koolproxy.sh start
fi

if [ $(nvram get aliddns_enable) = 1 ] ; then
logger -t "自动启动" "正在启动阿里 ddns ..."
/usr/bin/aliddns.sh start
fi

if [ $(nvram get ss_enable) = 1 ] ; then
logger -t "自动启动" "正在启动科学上网 ..."
/usr/bin/shadowsocks.sh start
fi

if [ $(nvram get adg_enable) = 1 ] ; then
logger -t "自动启动" "正在启动 adguardhome ..."
/usr/bin/adguardhome.sh start
fi

if [ $(nvram get wyy_enable) = 1 ] ; then
logger -t "自动启动" "正在启动音乐解锁 ..."
/usr/bin/unblockmusic.sh start
fi

if [ $(nvram get zerotier_enable) = 1 ] ; then
logger -t "自动启动" "正在启动 zerotier ..."
/usr/bin/zerotier.sh start
fi

if [ $(nvram get vlmcsd_enable) = 1 ] ; then
logger -t "自动启动" "正在启动 vlmcsd ..."
/usr/bin/vlmcsd.sh start &
fi

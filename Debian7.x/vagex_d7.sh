echo "您选择的操作系统是Debian 7.x"
echo "正在为您安装软件"
#更新
apt-get update
apt-get upgrade -y
#安装必要软件
apt-get install -y gnome
apt-get install -y xfonts-100dpi xfonts-100dpi-transcoded xfonts-75dpi xfonts-75dpi-transcoded xfonts-base
apt-get install -y tightvncserver
#配置文件
cat > /etc/sysconfig/vncservers<<EOF
#!/bin/shxrdb $HOME/.Xresources
xsetroot -solid grey
x-terminal-emulator -geometry 80x24+10+10 -ls -title "$VNCDESKTOP Desktop" &
# x-window-manager &
gnome-session &
EOF
#开启服务
echo "启动vnc服务，请输入密码（ 不少于8位）"
tightvncserver -geometry 1024x720 :1
echo "启动成功，暂停配置中。。。"
#暂停vnc
tightvncserver -kill :1
#设置开机启动
cat > /etc/init.d/tightvncserver<<EOF
#!/bin/sh
### BEGIN INIT INFO
# Provides: tightvncserver
# Required-Start: $syslog $remote_fs $network
# Required-Stop: $syslog $remote_fs $network
# Default-Start: 2 3 4 5
# Default-Stop: 0 1 6
# Short-Description: Starts VNC Server on system start.
# Description: Starts tight VNC Server. Script written by James Swineson.
### END INIT INFO
# /etc/init.d/tightvncserver
VNCUSER='root'
case "$1" in
start)
su $VNCUSER -c '/usr/bin/tightvncserver -geometry 800x600 -depth 24 :1'
echo "Starting TightVNC Server for $VNCUSER"
;;
stop)
pkill Xtightvnc
echo "TightVNC Server stopped"
;;
*)
echo "Usage: /etc/init.d/tightvncserver {start|stop}"
exit 1
;;
esac
exit 0`</pre>
EOF
#修改权限
chmod 755 /etc/init.d/tightvncserver
update-rc.d tightvncserver defaults
#重启vnc
tightvncserver :1

echo "================================================="
echo "安装完成！"
echo "感谢支持嘻哈小屋 :P"
echo "请重启服务器以让配置生效"
echo "已经设为开机自启"
echo "================================================="
exit 1

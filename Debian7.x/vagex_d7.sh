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
echo "启动vnc服务，请输入密码（ 不少于6位）"
tightvncserver -geometry 1024x720 :1
echo "================================================="
echo "安装完成！"
echo "感谢支持嘻哈小屋 :P"
echo "请重启服务器以让配置生效"
echo "暂未设置开机自启"
echo "================================================="
exit 1

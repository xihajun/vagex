echo "您选择的操作系统是Debian 8.x"
echo "正在为您安装软件"
#更新
apt-get update
apt-get upgrade -y
#安装必要软件
apt-get install -y gnome
apt-get install -y xfce4 xfce4-goodies gnome-icon-theme tightvncserver
apt-get install -y iceweasel
#新增用户
echo "新建vnc用户，请输入密码"
adduser vnc
apt-get install sudo
gpasswd -a vnc sudo
su - vnc
echo "启动vnc服务，请输入密码（ 不少于6位）"
vncserver
echo "================================================="
echo "安装完成！"
echo "感谢支持嘻哈小屋 :P"
echo "请重启服务器以让配置生效"
echo "暂未设置开机自启"
echo "================================================="
exit 1

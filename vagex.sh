#!/bin/bash
#下载安装 Xfce 4.4 和 VNC
wget https://raw.githubusercontent.com/catonisland/Vagex-For-CentOS-6/master/epel-release-6-8.noarch.rpm;
rpm -ivh epel-release-6-8.noarch.rpm
yum groupinstall -y xfce
yum install -y tigervnc tigervnc-server

#写入配置文件
cat > /etc/sysconfig/vncservers<<EOF
VNCSERVERS="1:root"
VNCSERVERARGS[1]="-geometry 800x600"
EOF
#创建密码
echo
echo
echo "You will be requested to enter a password not less than six digits."
vncpasswd
#启动服务
vncserver
#写入配置文件
cat > /root/.vnc/xstartup<<EOF
#!/bin/sh
/usr/bin/startxfce4
EOF
#配置权限
chmod +x ~/.vnc/xstartup
#重启
service vncserver restart
#开机启动
chkconfig vncserver on
#安装火狐
yum -y install firefox

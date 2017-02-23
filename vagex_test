#!/bin/bash
#更新时间2017.2.23

#写一个通用匹配的程序，以后就直接用这个了

#取操作系统的名称
Get_Dist_Name()
{
    if grep -Eqi "CentOS" /etc/issue || grep -Eq "CentOS" /etc/*-release; then
        DISTRO='CentOS'
        PM='yum'
    elif grep -Eqi "Debian" /etc/issue || grep -Eq "Debian" /etc/*-release; then
        DISTRO='Debian'
        PM='apt'
    elif grep -Eqi "Ubuntu" /etc/issue || grep -Eq "Ubuntu" /etc/*-release; then
        DISTRO='Ubuntu'
        PM='apt'
    elif grep -Eqi "Raspbian" /etc/issue || grep -Eq "Raspbian" /etc/*-release; then
        DISTRO='Raspbian'
        PM='apt'
	else
        DISTRO='unknow'
    fi
    Get_OS_Bit
}

Get_OS_Bit()
{
    if [[ `getconf WORD_BIT` = '32' && `getconf LONG_BIT` = '64' ]] ; then
        ver2='x64'
    else
        ver2='x32'
    fi
}

Get_Dist_Name

release=$DISTRO
#发行版本
if [ "$release" == "Debian" ]; then
	ver1str="lsb_release -rs | awk -F '.' '{ print \$1 }'"
else
	ver1str="lsb_release -rs | awk -F '.' '{ print \$1\".\"\$2 }'"
fi
ver1=$(eval $ver1str)
#ver11=`echo $ver1 | awk -F '.' '{ print $1 }'`

echo "================================================="
echo "操作系统：$release "
if [ "$ver1" == "" ]; then
  echo "发行版本：脚本获得不了操作系统版本号"
else
  echo "发行版本：$ver1 "
fi
echo "位数：$ver2 "
echo "================================================="

#安装相应的软件
if [ "$release" == "Debian" ]; then
  echo "1.Debian 7.x"
  read -p "请选择相应的发行版本系统（输入数字序号）：" number
  if [ "$number" == "" ]; then
    echo "未选择任何发行版本，脚本退出"
    exit 1
  elif [ "$number" == "1" ];then
    wget -N --no-check-certificate https://raw.githubusercontent.com/xihajun/vagex/master/Debian7.x/vagex_d7.sh && bash vagex_d7.sh
    exit 1
  else
    echo "目前该脚本只支持Debian 7.x其他系统会在以后更新"
    echo "感谢支持嘻哈小屋！"
    echo "欢迎您的再次来访：www.edu-ing.cn"
    exit 1
  fi
fi
if [ "$release" == "CentOS" ]; then
  echo "1.CentOS 5.x"
  echo "2.CentOS 6.x"
  read -p "请选择相应的发行版本系统（输入数字序号）：" number
  if [ "$number" == "" ]; then
    echo "未选择任何发行版本，脚本退出"
    exit 1
  elif [ "$number" == "1" ];then
    echo "您选择的操作系统是CentOS 5.x"
    echo "正在为您安装软件"
    yum groupinstall -y xfce-4.4
    yum install -y vnc vnc-server
    #关闭防火墙（重启后生效）
    chkconfig iptables off
  elif [ "$number" == "2" ];then
    echo "您选择的操作系统是CentOS 6.x"
    echo "正在为您安装软件"
    wget https://raw.githubusercontent.com/catonisland/Vagex-For-CentOS-6/master/epel-release-6-8.noarch.rpm;
    rpm -ivh epel-release-6-8.noarch.rpm
    yum groupinstall -y xfce
    yum install -y tigervnc tigervnc-server
    #关闭防火墙（重启后生效）
    chkconfig iptables off
  else
    echo "目前该脚本只支持CentOS 5.x、CentOS 6.x，其他系统会在以后更新"
    echo "感谢支持嘻哈小屋！"
    echo "欢迎您的再次来访：www.edu-ing.cn"
    exit 1
  fi
fi
if ["$release" == "Ubuntu"]; then
  echo "暂时不支持该操作系统"
  echo "目前该脚本只支持CentOS 5.x、CentOS 6.x、Debian7.x，其他系统会在以后更新"
  echo "感谢支持嘻哈小屋！"
  echo "欢迎您的再次来访：www.edu-ing.cn"
  exit 1
fi



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

# vagex一键包
看到网上很多一键包都失效了，为安装vagex，本linux小白花了好半天写了一个一键包(目前只支持centos5.x、centos 6.x)，望大神们批评指正

使用方式：

wget -N --no-check-certificate https://raw.githubusercontent.com/xihajun/vagex/master/vagex.sh && bash vagex.sh

最后需要reboot一下方可生效

重置密码命令：vncpasswd

重启vnc命令：service vncserver restart

测试脚本
wget -N --no-check-certificate https://raw.githubusercontent.com/xihajun/vagex/master/vagex_test.sh && bash vagex_test.sh


#!/bin/bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

public_file=./public.sh
publicFileMd5=$(md5sum ${public_file} 2>/dev/null|awk '{print $1}')
md5check="1e23b786caaf2d0737a2dc13a1e3f29f"
#if [ "${publicFileMd5}" != "${md5check}"  ]; then
#	wget -O Tpublic.sh http://download.bt.cn/install/public.sh -T 20;
#	publicFileMd5=$(md5sum Tpublic.sh 2>/dev/null|awk '{print $1}')
#	if [ "${publicFileMd5}" == "${md5check}"  ]; then
#		\cp -rpa Tpublic.sh $public_file
#	fi
#	rm -f Tpublic.sh
#fi

. $public_file

download_Url=$NODE_URL

run_path="./root"
Is_64bit=$(getconf LONG_BIT)
Setup_Path="./www/server/mysql"
Data_Path="./www/server/data"
sysType=$(uname -a|grep x86_64)
cat /etc/redhat-release|grep -oE "([6-8]\.)+"
CENTOS_OS=$(cat /etc/redhat-release|grep  -oEi centos)
if [ "${CENTOS_OS}" ];then
	el=$(cat /etc/redhat-release|grep -oE "([6-8]\.)+[0-9]+"|cut -f1 -d ".")
fi

ALIYUN_OS=$(cat /etc/redhat-release|grep  -oEi aliyun)
if [ "${ALIYUN_OS}" ];then
	el=$(uname -r|grep -oE "al7|al8"|grep -oE "[7-8]")
fi

if [ "${el}" == "6" ]; then
	wget -O mysql6.sh $download_Url/install/1/old/mysql.sh -T 20
#	bash mysql.sh $1 $2
	exit;
fi

if [ "${el}" == "8" ]; then
	if [ ! -f "/usr/bin/python" ];then
		yum install python3 -y
		ln -sf /usr/bin/python3 /usr/bin/python
	fi
fi
echo "${el}" "${Is_64bit}" "${sysType}"

exit;
if [ -z "${el}" ] || [ "${Is_64bit}" == "32" ] || [ -z "${sysType}" ];then
	wget -O mysql9.sh $download_Url/install/0/mysql.sh -T 20
#	bash mysql.sh $1 $2
	exit;
fi


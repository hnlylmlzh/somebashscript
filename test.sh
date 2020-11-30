#!/bin/bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

public_file=./public.sh
publicFileMd5=$(md5sum ${public_file} 2>/dev/null|awk '{print $1}')
md5check="1e23b786caaf2d0737a2dc13a1e3f29f"
if [ "${publicFileMd5}" != "${md5check}"  ]; then
#	wget -O Tpublic.sh http://download.bt.cn/install/public.sh -T 20;
#	publicFileMd5=$(md5sum Tpublic.sh 2>/dev/null|awk '{print $1}')
#	if [ "${publicFileMd5}" == "${md5check}"  ]; then
#		\cp -rpa Tpublic.sh $public_file
#	fi
#	rm -f Tpublic.sh
fi

. $public_file

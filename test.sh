PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
LANG=en_US.UTF-8
 
setup_path="/www"
python_bin=$setup_path/server/panel/pyenv/bin/python
cpu_cpunt=$(cat /proc/cpuinfo|grep processor|wc -l)
echo $cpu_cpunt

if [ "$1" ];then
	echo $0 $1
fi
startTime=`date +%s`
GetSysInfo(){
	if [ -s "/etc/redhat-release" ];then
		SYS_VERSION=$(cat /etc/redhat-release)
	elif [ -s "/etc/issue" ]; then
		SYS_VERSION=$(cat /etc/issue)
	fi
	SYS_INFO=$(uname -a)
	SYS_BIT=$(getconf LONG_BIT)
	MEM_TOTAL=$(free -m|grep Mem|awk '{print $2}')
	CPU_INFO=$(getconf _NPROCESSORS_ONLN)

	echo -e ${SYS_VERSION}
	echo -e Bit:${SYS_BIT} Mem:${MEM_TOTAL}M Core:${CPU_INFO}
	echo -e ${SYS_INFO}
	echo -e "请截图以上报错信息发帖至论坛www.bt.cn/bbs求助"
}
Red_Error(){
	echo '=================================================';
	printf '\033[1;31;40m%b\033[0m\n' "444";
	GetSysInfo
	exit 1;
}

 
endTime=`date +%s`
echo $endTime
((outTime=($endTime-$startTime)/60))
echo -e "Time consumed:\033[32m $outTime \033[0mMinute!"


for ((i=0;i<5;i++));do echo ­n $i;done
for((i=1;i<=100;i++));  
do   
echo $(expr $i \* 3 + 1);  
done
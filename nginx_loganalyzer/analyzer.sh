#!/bin/bash



#========================= global Variables ==============================
#top 5 IPs
ip1=0;ip2=0;ip3=0;ip4=0;ip5=0
ipval1=0;ipval2=0;ipval3=0;ipval4=0;ipval5=0
logfile=$1
logfilelines=0

#*******************************************************************************


#======================== Functions  ============================================

list_usr()
{
	ls /usr
	outy=$1
	echo "here the script output $outy"
}

count_ip()
{
	targetip=$1
	return $(grep -o ${targetip} ${logfile} | wc -l)
	
}

	

cascadetopips()
{
	local changed=$1
	local newip=$2
	local newipval=$3
	
	case $changed in
	        1)
			ip5=ip4;ip4=3;ip3=ip2;ip2=ip1;ip1=${newip}
			ipval5=ipval4;ipval4=ipval3;ipval2=ipval1;ipval1=${newipval}		
			;;
		2)
			ip5=ip4;ip4=3;ip3=ip2=${newip}
			ipval5=ipval4;ipval4=ipval3;ipval2=${newipval}		
			;;
		3)
			ip5=ip4;ip4=3;ip3=${newip}
			ipval5=ipval4;ipval4=ipval3=${newipval}
			;;
		4)
			ip5=ip4;ip4=${newip}
			ipval5=ipval4;ipval4=${newipval}
			;;
		5)
			ip5=${newip}
			ipval5=${newipval}
			;;
		*)
			echo "undefined paramter to cascadetopips"
			;;
	esac
		
}


comparewithtops()
{
	local targetip=$2
	
	#count_ip ${targetip} 
	#targipcount=$(returnsttuf) 
	local targetipcount=$1

 
	echo "target ip count is : ${targetipcount} ip is: ${targetip} " 	

	if [ $targetipcount -gt $ipval1 ];then
		cascadetopips 1  $targetip $targetipcount
	elif [ $targetipcount -gt $ipval2  ];then
		
		cascadetopips 2  $targetip $targetipcount
		
	elif [ $targetipcount -gt $ipval3  ];then

		cascadetopips 3  $targetip $targetipcount

	elif [ $targetipcount -gt $ipval4  ];then 
	
		cascadetopips 4  $targetip $targetipcount

	elif [ $targetipcount -gt $ipval5  ];then
		ip5=$targetip
		ipval5=$targetipcount
	fi	
	
}


definetopips()
{
	for ((i=logfilelines;i>=0;i--)) 
	do
		grepped=$(cut -d ' ' -f 1 ${logfile}  | uniq -c | grep -m 1 " ${i} " )
#|  awk -F' ' '{print $2}' )		
	
		if [ ! -z "${grepped}" ];then
			echo " grepped ${i}  found something : ${grepped}  "
			comparewithtops ${grepped}  	
		fi 
		
		grepped=""		
	
		#secho "doing comparing on ip : ${grepped}"
	done	
}


#compareip



#**********************************************************************************


if [ -z $logfile ]
then 
	echo -e " you didn't mentioned the logfile \n\t./loganlyzer -logfie-"
	exit 0
fi

logfilelines=$( wc ${logfile} | cut -d ' ' -f 3 )


if [ ! -f ${logfile} ];then
	echo "log file does not exist!!"
fi


definetopips

echo -e  "top1:${ip1} top2:${ip2} top3:${ip3} top4:${ip4} top5:${ip5}"
#ipval1=0;ipval2=0;ipval3=0;ipval4=0;ipval5=0





#!/bin/bash



#========================= global Variables ==============================
#top 5 IPs
ip1=0;ip2=0;ip3=0;ip4=0;ip5=0
ipval1=0;ipval2=0;ipval3=0;ipval4=0;ipval5=0
logfile=$1

#********************************************************************************


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

chekcwithtops()
{
	targetip=$1
	if [ $targetip   ];then
		
	fi
	
	
	
}

#compareip

#**********************************************************************************

echo "counting ip 178.128.94.113"
count_ip "178.128.94.113"
resvalue=$?
echo "count result : ${resvalue}"













if [ -z $logfile ]
then 
	echo -e "   you didn't mentioned the logfile \n\t./loganlyzer -logfie-"
	exit 0
fi




currdir=`pwd`
#result=`ls logfile`
echo "$result"

if [ ! -f ${logfile} ];then
	echo "log file does not exist!!"
fi

#logpath="${currdir}somex"
#echo "mix vales : ${logpath}"

#firstline=`head -n 3 "$logfile"`

#echo "there is a "

#echo "the logfile you mentioned is :$logfile"
#echo -e "first line is :\n $firstline" 

list_usr whussup

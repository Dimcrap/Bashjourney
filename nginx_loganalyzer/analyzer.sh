#!/bin/bash


list_usr()
{
	ls /usr
	outy=$1
	echo "here the script output $outy"
}

logfile=$1

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

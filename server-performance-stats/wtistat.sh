#!/bin/bash

tophead=$( top -b -n 1 | head -n 6 )
top5list=$( top -b -n 1 | head -n 13 | tail -n 5 )

printTop5cpu(){

	#top1=$( echo ${top5list} | awk -F ' ' '{print $12 }' )
	top1=$( top -b -n 1 | sed -n 8p )
	top2=$( top -b -n 1 | sed -n 9p )
	top3=$( top -b -n 1 | sed -n 10p )
	top4=$( top -b -n 1 | sed -n 11p )
	top5=$( top -b -n 1 | sed -n 12p )
	echo -e "\ntop 1th ${top1}\ntop 2th ${top2} \ntop 3th ${top3} \ntop 4th ${top4}\ntop 5th ${top5}\n "
	
}



cpuUs=$( echo ${tophead} | awk -F ' ' '{print $27 }' )
cpuSy=$( echo ${tophead} | awk -F ' ' '{print $29 }' )

# 'free' is usabe in this case 
usedmemory=$( echo ${tophead} | awk -F ' ' '{print $48 }')
freememory=$( echo ${tophead} | awk -F ' ' '{print $50 }')

# (inuse mem *100) / totaluse = use percentage

disktotal=$( df --total -BG | tail -n 1 | awk -F ' ' '{print $2}' )
diskused=$( df --total -BG | tail -n 1 | awk -F ' ' '{print $5}' )


totalcpuU=$( echo "${cpuUs} + ${cpuSy}" | bc )


echo -e "\t\t==== whatis server status ====\n"

#${cpuUse}\n memory usage ${memUse} " 
echo "result of summed total cpu usage : %${totalcpuU} "
echo -e  "inuse %${usedmemory}  free: %${freememory} "
echo -e "total disk : ${disktotal} used space of disk: ${diskused} \n"

#echo " plusing result $(( ${cpuUs} + ${cpuSy} )) "

printTop5cpu



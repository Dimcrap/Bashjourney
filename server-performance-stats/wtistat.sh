#!/bin/bash

tophead=$( top -b -n 1 | head -n 6 )


printTop5(){

	list=$1

	# awk -F ' ' '{print $9 }   -> will take all cpu usages

}


cpuUs=$( echo ${tophead} | awk -F ' ' '{print  $27 }' )
cpuSy=$( echo ${tophead} | awk -F ' ' '{print $29 }' )

# 'free' is usabe in this case 
usedmemory=$( echo ${tophead} | awk -F ' ' '{print $46 }')
freememory=$( echo ${tophead} | awk -F ' ' '{print $50 }')

disktotal=$( df --total -BG | tail -n 1 | awk -F ' ' '{print $2}' )
diskused=$( df --total -BG | tail -n 1 | awk -F ' ' '{print $5}' )


totalcpuU=$(echo "${cpuUs} + ${cpuSy}" | bc )

top5=$( top -b -n 1 | head -n 12 | tail -n 5 )


echo -e "\t\t==== whatis server status ====\ncpu usage :

#${cpuUse}\n memory usage ${memUse} " 
echo "result of summed : %${totalcpuU} "
echo -e  "inuse %${usedmemory} %${freememory} "
echo -e "total disk : ${disktotal} used space of disk: ${diskused} \n"

#echo " plusing result $(( ${cpuUs} + ${cpuSy} )) "



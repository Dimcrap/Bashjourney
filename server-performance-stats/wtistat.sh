#!/bin/bash


tophead=$( top -b -n 1 | head -n 6 )

cpuUs=$( echo ${tophead} | awk -F ' ' '{print  $27 }' )
cpuSy=$( echo ${tophead} | awk -F ' ' '{print $29 }' )
usedmemory=$( echo ${tophead} | awk -F ' ' '{print $46 }')
freememory=$( echo ${tophead} | awk -F ' ' '{print $50 }')


test=$(echo ${tophead}  )
echo -e  "inuse %${usedmemory} %${freememory} "
#echo " plusing result $(( ${cpuUs} + ${cpuSy} )) "

totalcpuU=$(echo "${cpuUs} + ${cpuSy}" | bc )
echo "tophead ${tophead} "

echo "result of summed : %${totalcpuU} "

#cpuUse=$(ps aux | grep -m 1 ./${reffserver} | awk -F ' ' '{ print $3 }' )
#memUse=$( ps aux | grep -m 1 ./${reffserver} | awk -F ' ' '{ print $4 }'  )
#memUse=$( top -b -n 1 | grep ${reffserver} | awk -F ' ' '{print $10}' )


#echo -e "\t\t====${reffserver}====\ncpu usage :
#${cpuUse}\n memory usage ${memUse} " 




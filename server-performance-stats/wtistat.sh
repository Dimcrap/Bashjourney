#!/bin/bash


tophead=$( top -b -n 1 | head -n 6 )

cpuUs=$( echo ${tophead} | awk -F ' ' '{print  $27 }' )
cpuSy=$( echo ${tophead} | awk -F ' ' '{print $29 }' )



echo "us and sy ${cpuUs} ${cpuSy} "
#echo " plusing result $(( ${cpuUs} + ${cpuSy} )) "

n1=5.4
summed=$(echo "${cpuUs} + ${cpuSy}" | bc)

#summed=$(echo "40 + 20" | bc)

echo "result of summed : ${summed} "

#cpuUse=$(ps aux | grep -m 1 ./${reffserver} | awk -F ' ' '{ print $3 }' )
#memUse=$( ps aux | grep -m 1 ./${reffserver} | awk -F ' ' '{ print $4 }'  )
#memUse=$( top -b -n 1 | grep ${reffserver} | awk -F ' ' '{print $10}' )



#echo -e "\t\t====${reffserver}====\ncpu usage :
# ${cpuUse}\n memory usage ${memUse} " 



reffserver=$1


if [ -z $reffserver ];then
	echo "no server name inputed!"
	exit 0
fi


cpuUse=$(ps aux | grep -m 1 ./${reffserver} | awk -F ' ' '{ print $3 }' )
#memUse=$( ps aux | grep -m 1 ./${reffserver} | awk -F ' ' '{ print $4 }'  )
memUse=$( top -b -n 1 | grep ${reffserver} | awk -F ' ' '{print $10}' )

top5process()
{
}




echo -e "\t\t====${reffserver}====\ncpu usage : ${cpuUse}\n memory usage ${memUse} " 



#!/bin/bash
#######################################################
#       author : baishaohua                           #
#       mail   : nginxs@126.com                       #
#       blog   : new.nginxs.net                       #
#       msg    : startup zookeeper cluster for docker #
#######################################################

#Shell Base Env
ZK_HOME="/usr/local/zookeeper"
ZK_CONF="${ZK_HOME}/conf/zoo.cfg"
ZK_DATA="/var/lib/zookeeper"
ZK_CONF_TXT="tickTime=2000\ninitLimit=10\nsyncLimit=5\ndataDir=${ZK_DATA}\nclientPort=2181"
usage(){
	echo 'only one argv:[ zk1 | zk2 | zk3 ]'
}
echo "zookeeper is start"
#init config
echo -e ${ZK_CONF_TXT} >${ZK_CONF}

#function
#ZK_NODE_LIST from docker argv
for i in ${ZK_NODE_LIST}
do
	echo "$i" >>${ZK_CONF}
done
echo "${ZK_ID}" >${ZK_DATA}/myid


#this shell main function
${ZK_HOME}/bin/zkServer.sh start-foreground

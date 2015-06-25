ZookeeperVersion=3.4.6
ZookeeperPseudoDistributedPath=/opt/zookeeper_pseudo_cluster
ZookeeperFileName=zookeeper-${ZookeeperVersion}
ZookeeperZipFile=${ZookeeperFileName}.tar.gz


ZookeeperNodeNum=3

mkdir -p ${ZookeeperPseudoDistributedPath}

cd ${ZookeeperPseudoDistributedPath}

groupadd zookeeper
useradd -g zookeeper zookeeper

## download
echo "download file:http://archive.apache.org/dist/zookeeper/stable/${ZookeeperZipFile}"
wget_output=$(wget http://archive.apache.org/dist/zookeeper/stable/${ZookeeperZipFile})
if [ $? -ne 0 ]
  then 
	echo "File Not Found"
	exit
  else 
	echo "Download OK"
fi


tar -zxf ${ZookeeperZipFile} -C ./

for((i=1;i<=${ZookeeperNodeNum};i++));do

	tmpFile=zookeeper${i}
	## del old file
	rm -rf ${tmpFile}
	cp -r ${ZookeeperFileName} ${tmpFile}
	mkdir -p ${tmpFile}/data/
	mkdir -p ${tmpFile}/logs/
	touch ${tmpFile}/data
	
	echo "tickTime=2000" >> ${tmpFile}/conf/zoo.cfg
	echo "initLimit=5" >> ${tmpFile}/conf/zoo.cfg
	echo "syncLimit=2" >> ${tmpFile}/conf/zoo.cfg
	echo "dataDir=${ZookeeperPseudoDistributedPath}/${tmpFile}/data" >> ${tmpFile}/conf/zoo.cfg
	echo "dataLogDir=${ZookeeperPseudoDistributedPath}/${tmpFile}/logs" >> ${tmpFile}/conf/zoo.cfg
	echo "clientPort=418${i}" >> ${tmpFile}/conf/zoo.cfg
	echo "server.0=127.0.0.1:8880:7770" >> ${tmpFile}/conf/zoo.cfg
	echo "server.1=127.0.0.1:8881:7771" >> ${tmpFile}/conf/zoo.cfg
	echo "server.2=127.0.0.1:8882:7772" >> ${tmpFile}/conf/zoo.cfg
	
	echo "${i}" >> ${tmpFile}/data/myid
	
	echo "start server:${tmpFile}"
	sh ${tmpFile}/bin/zkServer.sh start 
done

## chage power
chown -R zookeeper:zookeeper ${ZookeeperPseudoDistributedPath}



## 
echo "install finish"


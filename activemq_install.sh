BasePath=/opt
SoftwareRepo=/opt/software
mkdir -p ${SoftwareRepo}

ZipFileName=apache-activemq-5.11.1-bin.tar.gz
RepFilePath=${SoftwareRepo}/${ZipFileName}

DownLoadUrl=http://mirrors.hust.edu.cn/apache/activemq/5.11.1/apache-activemq-5.11.1-bin.tar.gz



if [ ! -f "$RepFilePath" ]; then
	echo "file not found,download from web."
	cd ${SoftwareRepo}
	wget_result=$(wget ${DownLoadUrl})
	if [ $? -ne 0 ]
	then 
		echo "Download fail"
		exit
	else
		echo "Download success"
		#mv ${ZipFileName} ${SoftwareRepo}
	fi
fi


cd ${BasePath}
tar -zxf ${RepFilePath} -C ${BasePath}

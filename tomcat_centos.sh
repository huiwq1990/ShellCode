BasePath=/opt
SoftwareRepo=/opt/software
mkdir -p ${SoftwareRepo}

ZipFileName=apache-tomcat-7.0.62.tar.gz
RepFilePath=${SoftwareRepo}/${ZipFileName}

DownLoadUrl=http://mirrors.hust.edu.cn/apache/tomcat/tomcat-7/v7.0.62/bin/${ZipFileName}



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

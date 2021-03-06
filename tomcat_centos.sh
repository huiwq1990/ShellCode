BasePath=/opt
SoftwareRepo=/opt/software
mkdir -p ${SoftwareRepo}

ZipFileName=apache-tomcat-7.0.62.tar.gz
RepFilePath=${SoftwareRepo}/${ZipFileName}

InstallFolderPath=/opt/apache-tomcat-7.0.62

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


cat>/etc/profile.d/tomcat.sh<<EOF
#!/bin/bash
Tomcat_HOME=${InstallFolderPath}
#防止输出变量值
PATH=\$Tomcat_HOME/bin:\$PATH
export PATH Tomcat_HOME
export CLASSPATH=.
EOF

chmod +x /etc/profile.d/tomcat.sh
source /etc/profile.d/tomcat.sh

BasePath=/opt
SoftwareRepo=/opt/software
mkdir -p ${SoftwareRepo}

ZipFileName=apache-maven-3.3.3-bin.tar.gz
RepFilePath=${SoftwareRepo}/${ZipFileName}

InstallFolderPath=/opt/apache-maven-3.3.3

DownLoadUrl=http://apache.fayea.com/maven/maven-3/3.3.3/binaries/${ZipFileName}



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



##设置环境变量


cat>/etc/profile.d/maven.sh<<EOF
#!/bin/bash
MVN_HOME=${InstallFolderPath}
#防止输出变量值
PATH=\$MVN_HOME/bin:\$PATH
export PATH MVN_HOME
export CLASSPATH=.
EOF

chmod +x /etc/profile.d/maven.sh
source /etc/profile.d/maven.sh
source /etc/profile

mvn -version  

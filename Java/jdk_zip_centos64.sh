#http://rensanning.iteye.com/blog/2193036


BasePath=/opt
SoftwareRepo=/opt/software
mkdir -p ${SoftwareRepo}

InstallFolderPath=${BasePath}/jdk1.7.0_79
ZipFileName=jdk-7u79-linux-x64.tar.gz
RepFilePath=${SoftwareRepo}/${ZipFileName}

DownLoadUrl=http://download.oracle.com/otn-pub/java/jdk/7u79-b15/jdk-7u79-linux-x64.tar.gz

# wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/7u79-b15/jdk-7u79-linux-x64.tar.gz"


cd ${SoftwareRepo}

if [ ! -f "$RepFilePath" ]; then
	echo "file not found,download from web."
	
	wget_result=$(wget --no-check-certificate --no-cookies - --header "Cookie: oraclelicense=accept-securebackup-cookie" ${DownLoadUrl} -O ${ZipFileName})
	if [ $? -ne 0 ]
	then 
		echo "Download fail"
		exit
	else
		echo "Download success"
		#mv ${ZipFileName} ${SoftwareRepo}
	fi
fi

tar -zxf ${RepFilePath} -C ${BasePath}

##设置环境变量
# vi /etc/profile.d/java.sh

cat>/etc/profile.d/java.sh<<EOF
#!/bin/bash
JAVA_HOME=${InstallFolderPath}
#防止输出变量值
PATH=\$JAVA_HOME/bin:\$PATH
export PATH JAVA_HOME
export CLASSPATH=.
EOF

chmod +x /etc/profile.d/java.sh
source /etc/profile.d/java.sh
source /etc/profile

java -version  

echo $JAVA_HOME 

echo "finish"

#http://rensanning.iteye.com/blog/2193036


BasePath=/opt
SoftwareRepo=/opt/software
mkdir -p ${SoftwareRepo}

ZipFileName=jdk-7u76-linux-x64.rpm
RepFilePath=${SoftwareRepo}/${ZipFileName}

DownLoadUrl=http://download.oracle.com/otn-pub/java/jdk/7u76-b13/jdk-7u76-linux-x64.rpm



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


rpm -ivh ${ZipFileName}



alternatives --install /usr/bin/java java /usr/java/default/bin/java 776

alternatives --config java

##设置环境变量
# vi /etc/profile.d/java.sh

cat>/etc/profile.d/java.sh<<EOF
    #!/bin/bash
    JAVA_HOME=/usr/java/default/
    PATH=$JAVA_HOME/bin:$PATH
    export PATH JAVA_HOME
    export CLASSPATH=.
EOF

chmod +x /etc/profile.d/java.sh
source /etc/profile.d/java.sh

java -version  
  
echo $JAVA_HOME 

echo "finish"

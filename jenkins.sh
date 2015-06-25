

BasePath=/opt
SoftwareRepo=/opt/software
mkdir -p ${SoftwareRepo}

ZipFileName=jenkins.war
RepFilePath=${SoftwareRepo}/${ZipFileName}

DownLoadUrl=http://mirrors.jenkins-ci.org/war/latest/${ZipFileName}


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

echo "process finish!"
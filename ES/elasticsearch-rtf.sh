
BasePath=/opt
SoftwareRepo=/opt/software
mkdir -p ${SoftwareRepo}

InstallFolderPath=${BasePath}/elasticsearch-rtf
ZipFileName=elasticsearch-rtf.zip
RepFilePath=${SoftwareRepo}/${ZipFileName}

DownLoadUrl=https://github.com/medcl/elasticsearch-rtf/archive/master.zip

cd $SoftwareRepo
wget_result=$(wget ${DownLoadUrl} -O ${ZipFileName})
if [ $? -ne 0 ]
then 
	echo "Download fail"
	exit
else
	echo "Download success"
	#mv ${ZipFileName} ${SoftwareRepo}
fi


tar -zxf ${RepFilePath} -C ${BasePath}

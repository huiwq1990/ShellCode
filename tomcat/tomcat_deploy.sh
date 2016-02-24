#!/bin/bash

#http://www.tuicool.com/articles/muiMRn
#http://www.linuxidc.com/Linux/2016-01/127258.htm

now=`date +%Y%m%d%H%M%S`
tomcatPath=/home/tomcat/software/tomcat6
backupPath=/home/tomcat/software/tomcat6/backup
deployPath=${tomcatPath}/webapps

projName=$1
war=`basename $2`
echo "filename: ${war%.*}"
echo "extension: ${war##*.}"

backupName=${war}_${now}

if [ -e "$war" ]; then
  echo -e "\033[34m war archive: $war \033[0m"
else 
  echo -e "\033[31m war archive '$war' not exists \033[0m"
  exit -1
fi

# change color
echo -e "\033[34m"

#create backup dir
if [ ! -d "$backupPath" ]; then
  mkdir "$backupPath"
fi
echo "tomcat home: $tomcatPath"
echo "backup path: $backupPath"
echo 'try to stop tomcat...'

pid=`ps aux|grep "java"|grep "$tomcatPath"|awk '{printf $2}'`
if [ -n $pid ]; then
  echo "tomcat pid: $pid";
  kill -9 $pid;
fi

echo 'stop tomcat finished...'

echo 'backup old archive...'
if [ -f "${deployPath}/$war" ]; then
  mv -v "${deployPath}/$war" "$backupPath/${backupName}";
fi

rm -rf ${deployPath}/${projName}*
echo "copy $war archive to webapps.."
cp -v "${war}" "${deployPath}"
cp -v "${war}" "${backupPath}"

echo -e "\033[32m"
echo 'startup tomcat...'

sh ${tomcatPath}/bin/startup.sh

tail -10f ${tomcatPath}/logs/catalina.out
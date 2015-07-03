
ProjectGitPath=/opt/github/zhiyin

projectpath=/opt/github/zhiyin/project/server
projectname=appapi

cd $projectpath

cd ${ProjectGitPath}
git fetch origin master:temp
git merge temp

cd $projectpath/$projectname

mvn clean
mvn install -Dmaven.test.skip=true



#cd $TOMCAT_HOME/bin/
#./shutdown.sh
tomcat_pid=`netstat -tlnp|grep 8005|awk '{print $7}'|awk -F '/' '{print $1}'`

kill -9 $tomcat_pid

cd $TOMCAT_HOME/webapps

rm -rf $projectname
rm -rf $projectname.war

cp $projectpath/$projectname/target/*.war  $TOMCAT_HOME/webapps/$projectname.war

cd $TOMCAT_HOME/bin/
./startup.sh
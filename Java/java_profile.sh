
PROFILE_PATH=/opt/applog/MskyLog/java_profile
mkdir -p $PROFILE_PATH

TODAY=$(date +%Y%m%d%H%M)

# get all process
jstackResult=`jps -l | awk -F ' ' '{system("jstack "$1" > '$PROFILE_PATH'/jstack."$2"'$TODAY'.log")} '`
jmapResult=`jps -l | awk -F ' ' '{system("jmap -dump:live,format=b,file='$PROFILE_PATH'/jmap."$2"'$TODAY'.log "$1)} '`

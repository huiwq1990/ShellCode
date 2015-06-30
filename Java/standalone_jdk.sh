#!/bin/sh
# 需独立配置，务必填写可以唯一区分主jar的名字（不包括版本号信息）
MAIN_JAR_NAME_TEMPLATE="XXXX"
# 需独立设置为所在服务器上的java工具所在路径
JDK_PATH="/opt/app/jdk1.6.0_22/bin/java"
# 独立进程main方法所在的类
MAIN_CLASS_NAME="main class"
CURRENT_FILE=$(readlink -f $0)
PWD=$(dirname $CURRENT_FILE)
MAIN_JAR=
for jar_name in $PWD/lib/*;
do
	if [[ $jar_name =~ $MAIN_JAR_NAME_TEMPLATE ]]
	then
		MAIN_JAR=$jar_name
		continue
	else
		CLASSPATH=$jar_name:"$CLASSPATH";
	fi
done
CLASSPATH=$MAIN_JAR:"$CLASSPATH";
# 执行echo后。主jar包应该出现在classpath头部
echo $CLASSPATH

#export LANG=zh_CN.GBK
nohup $JDK_PATH -classpath $CLASSPATH $MAIN_CLASS_NAME > /dev/null 2>&1 &



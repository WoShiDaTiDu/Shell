JAVA_HOME=/usr/java/jdk1.7.0_80
JRE_HOME=/usr/java/jdk1.7.0_80/jre
CLASS_PATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar:$JRE_HOME/lib
PATH=$JAVA_HOME/bin:$JRE_HOME/bin:$PATH
export JAVA_HOME CLASS_PATH PATH
export LD_LIBRARY_PATH=$JRE_HOME/lib:$LD_LIBRARY_PATH
export > /tmp/export.tmp.log
cd /usr/local/tomcat/apache-tomcat-mobile/bin/
./shutdown.sh
sleep 10
ps -ef|grep mobile |grep -v 'grep'|awk '{print $2}'|xargs kill -9
cd /usr/local/tomcat/apache-tomcat-mobile/logs/
rm -rf * 
sleep 10
cd /usr/local/tomcat/apache-tomcat-mobile/bin/
./startup.sh
sleep 10
cd /usr/local/tomcat/apache-tomcat-video/bin/
./shutdown.sh
sleep 10
ps -ef|grep video |grep -v 'grep'|awk '{print $2}'|xargs kill -9
cd /usr/local/tomcat/apache-tomcat-video/logs/
rm -rf *
sleep 10
cd /usr/local/tomcat/apache-tomcat-video/bin/
./startup.sh
cd /usr/local/tomcat/anychatCore61/bin/server/temp
rm -rf *
ps -ef|grep nginx|grep master|awk '{print $2}'|xargs kill -9
sleep 10
ps -ef|grep nginx|grep worker|awk '{print $2}'|xargs kill -9
sleep 10
cd /usr/local/nginx/logs
rm -rf *
touch a.txt creat file
cd /usr/local/nginx/sbin/
./nginx
sleep 1

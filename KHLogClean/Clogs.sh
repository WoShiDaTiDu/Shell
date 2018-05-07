JAVA_HOME=/usr/java/jdk1.7.0_80
JRE_HOME=/usr/java/jdk1.7.0_80/jre
CLASS_PATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar:$JRE_HOME/lib
PATH=$JAVA_HOME/bin:$JRE_HOME/bin:$PATH
export JAVA_HOME CLASS_PATH PATH
export LD_LIBRARY_PATH=$JRE_HOME/lib:$LD_LIBRARY_PATH
export > /tmp/export.tmp.log
shopt -s extglob
cd /root/
d=$(date +%Y-%m-%d_%H:%M:%S)
v=$(wc tt.txt -l|awk '{print $1}')
((v=$v+1))
echo $v 	$d 	'>>>>>>start>>>>>' >> tt.txt
cd /usr/games/Governor/control/
./mobile.sh
./front.sh
./middle.sh
./backend.sh
./video.sh
sleep 10
ps -ef|grep mobile |grep -v 'grep'|awk '{print $2}'|xargs kill -9
ps -ef|grep front |grep -v 'grep'|awk '{print $2}'|xargs kill -9
ps -ef|grep middle |grep -v 'grep'|awk '{print $2}'|xargs kill -9
ps -ef|grep backend |grep -v 'grep'|awk '{print $2}'|xargs kill -9
ps -ef|grep video |grep -v 'grep'|awk '{print $2}'|xargs kill -9
sleep 5
ps -ef|grep anychat|sed -n '1p;1q'|awk '{print $2}'|xargs kill -9
ps -ef|grep anychat|sed -n '1p;1q'|awk '{print $2}'|xargs kill -9
sleep 5
ps -ef|grep nginx|grep master|awk '{print $2}'|xargs kill -9
ps -ef|grep nginx|grep worker|awk '{print $2}'|xargs kill -9
sleep 5
cd /root/
d=$(date +%Y-%m-%d_%H:%M:%S)
v=$(wc tt.txt -l|awk '{print $1}')
((v=$v+1))
echo $v 	$d 	'>>>>>>clean>>>>>' >> tt.txt
cd /usr/local/tomcat/apache-tomcat-mobile/logs/
rm -rf * 
cd /usr/local/tomcat/apache-tomcat-front/logs/
rm -rf *
cd /usr/local/tomcat/apache-tomcat-middle/logs/
rm -rf *
cd /usr/local/tomcat/apache-tomcat-backend/logs/
rm -rf !(htLog)
cd /usr/local/tomcat/apache-tomcat-video/logs/
rm -rf *
cd /usr/local/tomcat/anychatCore61/bin/server/temp
rm -rf *
cd /usr/local/nginx/logs/
rm -rf *
sleep 10
cd /usr/local/nginx/sbin/
./nginx
sleep 10
cd /usr/local/tomcat/anychatCore61/bin/server
./runanychatcoreserver.sh
sleep 5
cd /usr/games/Governor/control/
./upmobile.sh
./upfront.sh
./upmiddle.sh
./upbackend.sh
./upvideo.sh
cd /root/
d=$(date +%Y-%m-%d_%H:%M:%S)
v=$(wc tt.txt -l|awk '{print $1}')
((v=$v+1))
echo $v 	$d 	'>>>>>>stop>>>>>' >> tt.txt
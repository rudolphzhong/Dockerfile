#!/bin/sh
#########echo $ip
# sudo su root
cp /etc/hosts /z/java/apache-tomcat-8.5.11/bin/hosts.temp
# sed -i "s/.*$(hostname)/$DOCKER_IP $(hostname)/" /etc/hosts.temp
#sed -i 's/^[^#].*express-service/#&/' /z/java/apache-tomcat-8.5.11/bin/hosts.temp
#sed -i "s/.*express-service/$ip $hostn/" /z/java/apache-tomcat-8.5.11/bin/hosts.temp
sed -i 's/^172.17/#&/' /z/java/apache-tomcat-8.5.11/bin/hosts.temp
#echo "$ip $hostn" >> /etc/hosts.temp
# rm -f /etc/hosts
cat /z/java/apache-tomcat-8.5.11/bin/hosts.temp > /etc/hosts
# /data/app/bin/start.sh

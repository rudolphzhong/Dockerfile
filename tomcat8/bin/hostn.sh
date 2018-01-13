#!/bin/sh

ip="172.16.18.81"
cp /etc/hosts /z/java/apache-tomcat-8.5.11/bin/hosts.temp
sed -i 's/^172.17/#&/' /z/java/apache-tomcat-8.5.11/bin/hosts.temp
echo "$ip `hostname`" >> /etc/hosts.temp
cat /z/java/apache-tomcat-8.5.11/bin/hosts.temp > /etc/hosts

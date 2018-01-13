#插入以下内容
#使用的基础镜像
FROM	debian:wheezy

#作者信息
MAINTAINER	rudolph "rudolph_zhong@qq.com"

#环境准备
RUN	mkdir -p /z/java/jdk1.8.0_111 && \
	mkdir -p /z/java/apache-tomcat-8.5.11 && \
	cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
	echo 'root:password' | chpasswd

ADD	tomcat8 /z/java/apache-tomcat-8.5.11
ADD	jdk8 /z/java/jdk1.8.0_111

RUN	apt-get remove -y --auto-remove && \
	rm -rf /var/lib/apt/lists/*

ENV	LC_ALL en_US.utf8

ENV JAVA_HOME /z/java/jdk1.8.0_111
ENV CATALINA_HOME /z/java/apache-tomcat-8.5.11
ENV PATH $PATH:$JAVA_HOME/bin:$CATALINA_HOME/bin

#暴露8080端口
EXPOSE 8080

#启动时运行tomcat
WORKDIR /z/java/apache-tomcat-8.5.11/bin
ENTRYPOINT	./hostn.sh && \
		./startup.sh && \
		tail -f /z/java/apache-tomcat-8.5.11/logs/catalina.out

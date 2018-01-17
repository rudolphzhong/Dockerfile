#插入以下内容
#使用的基础镜像
FROM	debian:wheezy

#作者信息
MAINTAINER	rudolph "rudolph_zhong@qq.com"

#环境准备
RUN	mkdir -p /z/java/jdk1.8.0_111 && \
	mkdir -p /z/java/apache-tomcat-8.5.11 && \
	cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
	apt-get update -y && \
	apt-get install -y locales curl && \
	echo "zh_CN.UTF-8 UTF-8" >> /etc/locale.gen && \
	locale-gen && \
	echo "LANG=zh_CN.UTF-8" >> /etc/default/locale && \
	apt-get remove -y --auto-remove && \
	rm -rf /var/lib/apt/lists/* && \
	echo 'root:password' | chpasswd

# ==> 复制tomcat+jdk目录
ADD	tomcat8 /z/java/apache-tomcat-8.5.11
ADD	jdk8 /z/java/jdk1.8.0_111

# ==> 配置编码环境变量
ENV	LANG zh_CN.UTF-8
ENV	LANGUAGE zh_CN.UTF-8
ENV	LC_ALL zh_CN.UTF-8
# ==> 配置java环境变量
ENV	JAVA_HOME /z/java/jdk1.8.0_111
ENV	CATALINA_HOME /z/java/apache-tomcat-8.5.11
ENV	PATH $PATH:$JAVA_HOME/bin:$CATALINA_HOME/bin

#暴露8080端口
EXPOSE	8080

#启动时运行tomcat
WORKDIR	/z/java/apache-tomcat-8.5.11/bin
ENTRYPOINT	./hostn.sh && \
		./startup.sh && \
		tail -f /z/java/apache-tomcat-8.5.11/logs/catalina.out

# ==> 容器健康检查
HEALTHCHECK --interval=10s --timeout=5s \
	CMD	curl -fs http://127.0.0.1:8080 || exit 1

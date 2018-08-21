# ==> 使用的基础镜像
FROM	debian:wheezy

# ==> 作者信息
MAINTAINER	Rudolph Zhong "rudolph.zhong@zxfamily.top"

# ==> 环境准备
RUN	mkdir -p /jar && \
	mkdir -p /home/logs && \
	mkdir -p /usr/java && \
	cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
	apt-get update -y && \
	apt-get install -y locales curl whiptail procps htop telnet && \
	echo "zh_CN.UTF-8 UTF-8" >> /etc/locale.gen && \
	locale-gen && \
	echo "LANG=zh_CN.UTF-8" >> /etc/default/locale && \
	apt-get remove -y --auto-remove && \
	rm -rf /var/lib/apt/lists/* && \
	echo 'root:password' | chpasswd

ADD	jdk1.8.0_111 /usr/java/jdk1.8.0_111

# ==> 配置编码、时区变量
ENV	LANG="zh_CN.UTF-8" \
	LANGUAGE="zh_CN.UTF-8" \
	LC_ALL="zh_CN.UTF-8" \
	JAVA_HOME="/usr/java/jdk1.8.0_111" \
	JAVA_BIN="/usr/java/jdk1.8.0_111/bin" \
	CLASSPATH=".:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar" \
	PATH="$PATH:$JAVA_HOME/bin"

# ==> 启动时运行jar
WORKDIR	/jar
CMD	/usr/java/jdk1.8.0_111/bin/java -jar ${JAVA_OPTS} ${CATALINA_OPTS} *.jar >> /home/logs/jar_running.log 2>&1 && \
	tail -f /home/logs/jar_running.log

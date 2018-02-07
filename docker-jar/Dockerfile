#插入以下内容
#使用的基础镜像
FROM	java:8u111-jdk-alpine

#作者信息
MAINTAINER	rudolph "rudolph_zhong@qq.com"

#环境准备
RUN	mkdir -p /jar && \
	mkdir -p /logs && \
	echo 'root:password' | chpasswd

# ==> 配置编码、时区变量
ENV	LANG="zh_CN.UTF-8" \
	LANGUAGE="zh_CN.UTF-8" \
	LC_ALL="zh_CN.UTF-8" \
	TZ="Asia/Shanghai"

#启动时运行jar
WORKDIR	/jar
CMD	java -jar *.jar >> /logs/jar_running.log 2>&1 && \
	tail -f /logs/jar_running.log

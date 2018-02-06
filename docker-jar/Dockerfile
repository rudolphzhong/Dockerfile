#插入以下内容
#使用的基础镜像
FROM	java:8u111-jdk-alpine

#作者信息
MAINTAINER	rudolph "rudolph_zhong@qq.com"

#环境准备
RUN	mkdir -p /jar && \
	mkdir -p /logs && \
	rm -rf /var/lib/apt/lists/* && \
	echo 'root:password' | chpasswd

# ==> 配置编码环境和JAVA环境变量
ENV	LANG="zh_CN.UTF-8" \
	LANGUAGE="zh_CN.UTF-8" \
	LC_ALL="zh_CN.UTF-8" \
	TZ="Asia/Shanghai"

#暴露8080端口
EXPOSE	8080

#启动时运行jar
WORKDIR	/jar
ENTRYPOINT	java -jar *.jar >> /logs/jar.log 2>&1 && \
			tail -f /logs/jar_running.log

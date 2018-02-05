#插入以下内容
#使用的基础镜像
FROM	openjdk:8-jre-alpine

#作者信息
MAINTAINER	rudolph "rudolph_zhong@qq.com"

#环境准备
RUN	mkdir -p /jar && \
	mkdir -p /logs && \
	echo 'root:password' | chpasswd

# ==> 配置编码环境和JAVA环境变量
ENV	LANG="zh_CN.UTF-8" \
	LANGUAGE="zh_CN.UTF-8" \
	LC_ALL="zh_CN.UTF-8" 

#暴露8080端口
EXPOSE	8080

#启动时运行tomcat
WORKDIR	/jar
ENTRYPOINT	java -jar *.jar >> /logs/jar_running.log 2>&1 && \
		tail -f /var/log/jar_running.log

# ==> 容器健康检查
HEALTHCHECK --interval=2s --timeout=3s \
	CMD	telnet 127.0.0.1 8080 || exit 1

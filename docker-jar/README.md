SpringBoot应用Dockerfile
---

内含OpenJDK8

Dockerfile说明
---

* 编码为zh_CN.UTF-8
* HealthCheck机制为用telnet检查8080端口返回，无返回或3秒无响应均为unhealthy状态

使用说明
---

```
shell> git clone https://github.com/rudolphzhong/Dockerfile.git && cd Dockerfile/docker-jar
shell> docker build -t jar:openJDK8 .
```

**创建容器例子**

```
docker run -d --restart=always --name appname \
	-p 8080:8080 \
	-v /data/jar/jar:/jar \
	-v /data/jar/logs:/logs \
    --ulimit nofile=20480:40960 jar:openJDK8
```

*其他挂载目录须根据实际情况挂载*  

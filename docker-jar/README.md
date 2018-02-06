SpringBoot应用Dockerfile
---

基础镜像为java/8u111-jdk-alpine

Dockerfile说明
---

* 编码为zh_CN.UTF-8
* 时区为亚洲上海

使用说明
---

```
shell> git clone https://github.com/rudolphzhong/Dockerfile.git && cd Dockerfile/docker-jar
shell> docker build -t jar:jdk8 .
```

**创建容器例子**

```
docker run -d --restart=always --name appname \
	-v /data/jar/jar:/jar \
	-v /data/jar/logs:/logs \
    --ulimit nofile=20480:40960 jar:jdk8
```

*其他挂载目录须根据实际情况挂载*  

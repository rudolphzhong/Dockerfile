SpringBoot应用Dockerfile
---

基础镜像为debian/wheezy

Dockerfile说明
---

* 编码为zh_CN.UTF-8
* 时区为亚洲上海(java可能有存在与系统时区不一致问题，需要在创建容器时加入环境变量-Duser.timezone=Aisa/Shanghai)

使用说明
---

```
shell> git clone https://github.com/rudolphzhong/Dockerfile.git && cd Dockerfile/docker-jar
shell> docker build -t jar-jdk8:latest .
```

**创建容器例子**
    将下方java.rmi.server.hostname com.sun.management.jmxremote.port com.sun.management.jmxremote.rmi.port改为相应的ip和port

```
docker create -p 80:8080 \
	--name appname \
        --env JAVA_OPTS='-server -Xms504m -Xmx896m -XX:PermSize=504M -XX:MaxPermSize=896M -Duser.timezone=Aisa/Shanghai -Duser.timezone=Aisa/Shanghai -XX:+PrintGC -XX:+PrintGCDetails -XX:+PrintTenuringDistribution -XX:+PrintHeapAtGC -XX:+PrintGCTimeStamps -XX:+PrintGCDateStamps -XX:+HeapDumpOnOutOfMemoryError -Dcom.sun.management.jmxremote=true -Djava.rmi.server.hostname=192.168.1.1 -Dcom.sun.management.jmxremote.port=12345 -Dcom.sun.management.jmxremote.rmi.port=12345 -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.local.only=false -Dcom.sun.management.jmxremote.authenticate=false' \
        --env CATALINA_OPTS='-Dcom.sun.management.jmxremote=true -Djava.rmi.server.hostname=192.168.1.1 -Dcom.sun.management.jmxremote.port=12345 -Dcom.sun.management.jmxremote.rmi.port=12345 -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.local.only=false -Dcom.sun.management.jmxremote.authenticate=false' \
	-v /data/jar/jar:/jar \
	-v /data/jar/logs:/home/logs \
        --ulimit nofile=20480:40960 jar-jdk8:latest
```

*其他挂载目录须根据实际情况挂载*  

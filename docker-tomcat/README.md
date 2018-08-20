tomcat服务docker（适用dubbo框架）
---

内含JDK1.8.0_111及tomcat-8.5.11

Dockerfile说明
---

* 编码为zh_CN.UTF-8
* 时区为Asia/Shanghai
* 容器启动时将容器内hostname的ip宿主机的ip（须手动配置tomcat/bin/hostn.sh文件内$ip参数）
* 容器启动将自启动tomcat并将catalina.out日志传到docker logs
* HealthCheck机制为用curl检查8080端口返回，无返回或5秒无响应均为unhealthy状态

使用说明
---

```
shell> git clone https://github.com/rudolphzhong/dubboDockerfile.git && cd dubboDockerfile
shell> docker build -t debian-dubbo:0.1.0 .
```

**创建容器例子**

```
docker create -p 10011:8080 -p 11011:11011 \
    --env dubbo_protocol_port='11011' \
    --name dubbo-test --hostname dubbo-test \
    -v $tomcat/logs:/z/java/apache-tomcat-8.5.11/logs \
    -v $tomcat/bin:/z/java/apache-tomcat-8.5.11/bin \
    -v $tomcat/conf:/z/java/apache-tomcat-8.5.11/conf \
    -v $tomcat/webapps:/z/java/apache-tomcat-8.5.11/webapps \
    -v $tomcat/work:/z/java/apache-tomcat-8.5.11/work \
    -v $tomcat/lib:/z/java/apache-tomcat-8.5.11/lib \
    --ulimit nofile=20480:40960 debian-dubbo:0.1.0
```

*1.其他挂载目录须根据实际情况挂载*  
*2.环境变量中的dubbo_protocol_port应将代码中注册zookeeper的端口以该名称取环境变量，达到便于大量部署的效果*  
*3.由于目前的需求，此镜像是用宿主机的ip做通讯的，后续会提交用docker网卡的版本*  

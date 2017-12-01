#插入以下内容
#使用的基础镜像
FROM centos:6.8
#作者信息
MAINTAINER yzoo "yzoo@qq.com"

#创建目录
#RUN mkdir -p /z/java/jdk1.7.0_79
RUN mkdir -p /z/java/jdk1.8.0_111

#ADD jdk /z/java/jdk1.7.0_79
ADD jdk8 /z/java/jdk1.8.0_111

#RUN mkdir -p /z/java/apache-tomcat-7.0.53
RUN mkdir -p /z/java/apache-tomcat-8.5.11

#ADD tomcat /z/java/apache-tomcat-7.0.53
ADD tomcat8 /z/java/apache-tomcat-8.5.11

RUN rm -rf /etc/localtime && ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime


#编码也可以只用下面注释的三条
ENV LANG en_US.UTF-8    
ENV LANGUAGE en_US:en    
ENV LC_ALL en_US.UTF-8

#添加环境变量
#ENV JAVA_HOME /z/java/jdk1.7.0_79
ENV JAVA_HOME /z/java/jdk1.8.0_111

#ENV CATALINA_HOME /z/java/apache-tomcat-7.0.53
ENV CATALINA_HOME /z/java/apache-tomcat-8.5.11
ENV PATH $PATH:$JAVA_HOME/bin:$CATALINA_HOME/bin
ENV LANG en_US.UTF-8    
ENV LANGUAGE en_US:en    
ENV LC_ALL en_US.UTF-8
#暴露8080端口
EXPOSE 8080

RUN chmod -R 777 /home 
VOLUME ["/data"]
RUN chmod -R 777 /data
RUN echo 'root:Hpoly' | chpasswd

RUN mkdir -p /var/user
RUN groupadd xzh
RUN useradd -g xzh -d /var/user/zy zy 
RUN echo 'zy:Hpoly2' | chpasswd
RUN chown zy:xzh -R /z/java/apache-tomcat*
USER zy
WORKDIR /var/user/zy

#启动时运行tomcat
WORKDIR /z/java/apache-tomcat-8.5.11/bin
#CMD ["/z/java/apache-tomcat-8.5.11/bin/catalina.sh","run"]
ENTRYPOINT ./hostn.sh && ./startup.sh && tail -f /z/java/apache-tomcat-8.5.11/logs/catalina.out


FROM ubuntu:20.04
ENV CATALINA_HOME /usr/share/tomcat9
ENV PATH $CATALINA_HOME/bin:$PATH
RUN mkdir -p "$CATALINA_HOME"
ENV CATALINA_BASE /var/lib/tomcat9
RUN apt-get update
RUN apt install default-jdk -y
RUN apt install tomcat9 -y
RUN apt install maven -y
RUN apt install git -y
RUN cd /root
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
RUN cd /boxfuse-sample-java-war-hello
RUN mvn -f /boxfuse-sample-java-war-hello/pom.xml package
RUN cp /boxfuse-sample-java-war-hello/target/hello-1.0.war /var/lib/tomcat9/webapps/
EXPOSE 8080
WORKDIR $CATALINA_HOME
CMD ["catalina.sh", "run"]
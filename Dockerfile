FROM tomcat:9.0-alpine
RUN apk update --no-cache \
&& apk add openjdk8 \
&& apk add maven \
&& apk add git \
&& apk cache clean
WORKDIR /home
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
RUN mvn -f ./boxfuse-sample-java-war-hello/pom.xml package
RUN cp ./boxfuse-sample-java-war-hello/target/hello-1.0.war /usr/local/tomcat/webapps/
# EXPOSE 8080
# WORKDIR $CATALINA_HOME
# CMD ["catalina.sh", "run"]
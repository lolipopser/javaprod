
FROM tomcat:latest
RUN apt-get update
RUN apt-get install default-jdk -y
RUN apt-get install maven -y
RUN apt-get install git -y
RUN mkdir /var/boxfuse_src
WORKDIR /var/boxfuse_src
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
WORKDIR /var/boxfuse_src/boxfuse-sample-java-war-hello
RUN mvn package
WORKDIR /var/lib/
RUN pwd
RUN ls -la
RUN cp /var/boxfuse_src/boxfuse-sample-java-war-hello/target/hello-1.0.war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["catalina.sh", "run"]

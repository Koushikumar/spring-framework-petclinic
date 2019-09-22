FROM tomcat:9-jdk8
maintainer koushiknayak60@gmail.com
ADD ./target/petclinic.war /usr/local/tomcat/webapps
EXPOSE 8090

FROM tomcat:9-jdk8
maintainer koushiknayak60@gmail.com
COPY ./traget/petclinic.war /usr/local/app
ADD ./target/petclinic.war /usr/local/tomcat/webapps
EXPOSE 8090

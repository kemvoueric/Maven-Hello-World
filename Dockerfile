# Pull base image 
From tomcat:8.5.70-jre8-openjdk

# Maintainer 
MAINTAINER "valaxytech@gmail.com" 
COPY ./webapp.war /usr/local/tomcat/webapps

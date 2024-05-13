FROM tomcat:10-jdk17-openjdk-slim
# Create the directory for application properties if it doesn't exist
RUN mkdir -p /usr/local/tomcat/conf/Catalina/localhost/application.properties
# Copy application properties to Tomcat configurations
COPY application-youtube-rawdata.properties /usr/local/tomcat/conf/Catalina/localhost/application.properties
# Copy Tomcat configurations
COPY youtube-rawdata-be.xml /usr/local/tomcat/conf/Catalina/localhost/application.properties
# Copy war file to the webapps directory
COPY youtube-rawdata-be.war /usr/local/tomcat/webapps
COPY youtube-rawdata-fe.war /usr/local/tomcat/webapps
# Copy Tomcat configurations
RUN cp -r $CATALINA_HOME/webapps.dist/* $CATALINA_HOME/webapps

EXPOSE 8081
# Start Tomcat and MySQL
CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]


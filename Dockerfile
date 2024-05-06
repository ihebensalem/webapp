FROM tomcat:10-jdk17-openjdk-slim

# Create the directory for application properties if it doesn't exist
RUN mkdir -p /usr/local/tomcat/conf/Catalina/localhost/application.properties

# Copy application properties and xml file to the specified location
COPY /home/iheb/Desktop/multi-env/application-youtube-rawdata.properties /usr/local/tomcat/conf/Catalina/localhost/application.properties/
COPY /home/iheb/Desktop/multi-env/youtube-rawdata-be.xml /usr/local/tomcat/conf/Catalina/localhost/

# Copy war file to the webapps directory
COPY /home/iheb/Desktop/multi-env/youtube-rawdata-be.war /usr/local/tomcat/webapps

# Copy Tomcat configurations
RUN cp -r $CATALINA_HOME/webapps.dist/* $CATALINA_HOME/webapps

# Expose port 8080
EXPOSE 8080

# Start Tomcat
CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]


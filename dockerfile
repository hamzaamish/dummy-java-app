# Use Tomcat as the base image
FROM tomcat:9.0

# Set the working directory for Tomcat
WORKDIR /usr/local/tomcat/webapps

# Copy the WAR file into the Tomcat webapps directory and rename it as ROOT.war
COPY target/dummy-java-app.war ROOT.war

# Expose the default Tomcat port
EXPOSE 9090

# Start Tomcat
CMD ["catalina.sh", "run"]


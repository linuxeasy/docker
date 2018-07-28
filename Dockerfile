FROM openjdk:7-jdk-slim
RUN apt-get update && apt-get install -y --no-install-recommends \
                wget \
                        && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /opt/tomcat && cd /opt/tomcat \
    && wget http://www-us.apache.org/dist/tomcat/tomcat-8/v8.5.32/bin/apache-tomcat-8.5.32.zip \
    && unzip apache-tomcat-8.5.32.zip \
    && chmod ugo+wrx apache-tomcat-8.5.32/bin/* \
	&& rm -f apache-tomcat-8.5.32.zip
	
EXPOSE 8080

CMD ["/opt/tomcat/apache-tomcat-8.5.32/bin/catalina.sh", "run"]



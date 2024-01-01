FROM ghcr.io/integon/wso2mi:4.2.0

# car from current project and additional
COPY --chown=wso2carbon:wso2 ./mi-home/carbonapps /home/wso2carbon/wso2mi-4.2.0/repository/deployment/server/carbonapps

# jar from current project and additional
COPY --chown=wso2carbon:wso2 ./mi-home/lib /home/wso2carbon/wso2mi-4.2.0/lib

# mi config toml
COPY --chown=wso2carbon:wso2 ./mi-home/conf/deployment.toml /home/wso2carbon/wso2mi-4.2.0/conf/deployment.toml

# log4j2 properties 
COPY --chown=wso2carbon:wso2 ./mi-home/conf/log4j2.properties /home/wso2carbon/wso2mi-4.2.0/conf/log4j2.properties

# sslsender profile conf 
COPY --chown=wso2carbon:wso2 ./mi-home/conf/sslprofiles/senderprofiles.xml /home/wso2carbon/wso2mi-4.2.0/conf/sslprofiles/senderprofiles.xml

# the jks referenced in the senderprofile
COPY --chown=wso2carbon:wso2 ./mi-home/security/some-truststore.jks /home/wso2carbon/wso2mi-4.2.0/repository/resources/security/some-truststore.jks

# Configured in the copied `conf/deployment.toml`
EXPOSE 8080 8043

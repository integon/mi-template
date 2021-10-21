FROM wso2/wso2mi:4.0.0
COPY ./target/capp $WSO2_SERVER_HOME/repository/deployment/server/carbonapps
COPY ./mi-home/conf/deployment.toml $WSO2_SERVER_HOME/conf/deployment.toml
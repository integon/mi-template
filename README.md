# Template Micro Integrator for Visual Studio Code
This is a sample project for the WSO2 Micro Integrator

### Build

- Build car with Maven: `mvn clean package`
- Run on Docker: `docker-compose up`
- Call the Demo API: `curl -k https://localhost:8243/health`

### Test

See [test-with-httpyac](docs/modules/ROOT/pages/test-with-httpyac.adoc).


### Makefile

## Build

    make build

## Run as docker

    make run


## Deploy to remote mi-1.2.0
The Micro Integrato 1.2.0 has a Management API to connect and upload car files.

Setup the variables in this Makefile:

    remote-host=localhost
    remote-port=9164
    remote-auth=YWRtaW46YWRtaW4K --Base64 of "username:password"
    remote-token=

The remote-token can be achieved by calling

    make deploy-get-token

Copy the access token to the Makefile variable remote-token
Now the carbonapp can be deployed with a make command.

    make deploy

## Deploy to remote Micro Integrator 4.0.0
The MI-4.0.0 does not anymore support the Admin API. Just copy the .car file with ssh to the %MI_HOME%/repository/deployment/server/carbonapps folder.

# Template Micro Integrator for Visual Studio Code
This is a sample project for the WSO2 Micro Integrator

### Build

- Build car with Maven: `mvn clean package`
- Run on Docker: `docker-compose up`
- Call the Demo API: `curl -k https://localhost:8243/health`

### Test

HttpYac is used to test the Micro Integrator and the tests are automatically run with `docker compose up`. However you can also manually run the tests with:

```bash
docker run -it --rm -v $(pwd)/src/test/httpyac:/app/httpyac httpyac:5.8.2 \
    "httpyac" -a -o short -e docker
```

See the
[Test with HttpYac](https://integon.gitlab.io/docs/wiki/wso2/1.0.0/test-with-httpyac.html) 
for more details on how this works.


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

remote-host=localhost
remote-port=9164
# echo 'admin:admin' | base64
remote-auth=YWRtaW46YWRtaW4K
remote-token=eyJraWQiOiIyYzVkMTJmNC02NmQzLTQxMzYtODJiZC00YWFkN2JiY2Q3YjkiLCJhbGciOiJSUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlzcyI6Imh0dHBzOlwvXC8xMjcuMC4wLjE6OTE2NFwvIiwiZXhwIjoxNjM2ODIwODMwfQ.f-Y82N_RnU9Df4CZeg7cacbWInyQx2ucDSoz0m7tZESTlX_v17JtCImyOE-aZwXKuZHYFFLXThbjkGy1fDLhGBGglP35Ib8jg-1BCfaPWOh3em53GzpuAMn4S0snLSjn5NP9tjQoPqf_MyHt61Op-MO0tT9_7UPlzi-eI1Lb-ZT8p1pSsQpO9c_-vThpv0xcyrkZc6saudJTtecXdv1rXjsWHdnATDfL5hlNS5laz8W6TEXIhd6rs2esEpYI-IFGmbb9NQW0_EctQpJW1mPM2s6Wzz12kaH7FIjSHyLXb6Nox8W3wETSZBb-J3NRbFxP53AnDr477ysAxc3uoQ1WOw

all: build run

build:
	mvn clean package

run:
	docker compose up

clean:
	mvn clean
	rm -f target/capp/*.jar target/capp/*.car
	-rmdir target/capp

docker-build:
	docker build . -t integon/mi-template

docker-push:
	docker push integon/mi-template #push latest

#get the token and call the push carbonapp
deploy-get-token:
	curl -X GET "https://localhost:9164/management/login" -H "accept: application/json" -H "Authorization: Basic ${remote-auth}" -k -i

deploy-list:
	curl -X GET "https://${remote-host}:${remote-port}/management/applications" -H "accept: application/json" -H "Authorization: Bearer ${remote-token}" -k -i

deploy:
	curl -X POST "https://${remote-host}:${remote-port}/management/applications" --form "file=@target/capp/mi-template_1.0.0.car" -H "Authorization: Bearer ${remote-token}" -k -i

# running tests
## cURL "tests"
### data service tests
test:
	curl  http://localhost:8280/health


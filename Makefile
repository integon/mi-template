all: clean-build run

clean-build:
	mvn clean install

build:
	mvn install

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

# running tests
## cURL "tests"
### data service tests
test:
	curl  http://localhost:8280/health


SHELL := /bin/bash

build:
	mvn clean package
	podman build -t mi-test:latest . --no-cache

run:
	podman run -d --name mi-test -p 8080:8080 mi-test:latest
	@trap 'echo "\nMakefile received Ctrl+C - stop logging..."; exit 0' INT; \
    	echo "logging container..."; \
    	podman logs --follow mi-test

clean:
	mvn clean

stop:
	podman stop mi-test || true

delete: 
	podman rm --force mi-test || true
	
fresh:	stop delete clean build run

test:
	curl  http://localhost:8080/health


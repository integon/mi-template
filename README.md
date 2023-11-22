# WSO2 Micro-Integrator 4.2 Developer Template

This repository contains a developer template for WSO2 Micro-Integrator 4.2, equipped with a Makefile that simplifies common development tasks.

## Prerequisites
Before you begin, ensure you have the following tools installed on your machine:

- **Java 11:** Make sure you have Java Development Kit (JDK) 11 installed.

- **Maven:** Maven is used for building and managing the project.

- **Podman:** Podman is used for building and running containerized applications. Make sure you have Podman installed on your machine. 

## Makefile Commands

### Build
To build the WSO2 Micro-Integrator project, run the following command:
```bash
make build
```
This command will clean the project, package it using Maven, and then build a Container image using Podman.

### Run
To run the WSO2 Micro-Integrator in a container, use the following command:
```bash
make run
```
This command starts a container named mi-test in detached mode, exposing the Micro-Integrator on port 8080. It also logs the container output, and you can stop the logging using Ctrl+C.

### Clean
To clean the project and remove any generated files, run:
```bash
make clean
```

### Stop
To stop the running Podman container, use:
```bash
make stop
```

### Delete
To forcefully remove the Podman container, run:
```bash
make delete
```

### Fresh
To perform a complete fresh build, including cleaning, building, and running the container, use:
```bash
make fresh
```

### Test
To test the Micro-Integrator health endpoint, run:
```bash
make test
```
This command sends a GET request to http://localhost:8080/health.

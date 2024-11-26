# Dummy Java Application with Docker and Kubernetes

This repository contains a simple Java application that demonstrates how to build, package, and deploy a Java application using Docker and Kubernetes. The project uses Apache Tomcat to run the application as a WAR file, exposed on port 8080.

## Project Structure

- **Dockerfile**: The Dockerfile to build the custom Docker image.
- **Kubernetes Deployment**: YAML files for deploying the application in a Kubernetes cluster.
- **Java Application**: The source code of the demo Java application.

## Prerequisites

To use this project, make sure you have the following installed:

- [Docker](https://www.docker.com/get-started)
- [Kubernetes](https://kubernetes.io/docs/setup/)
- [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/)
- [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)

## Building the Docker Image

Follow these steps to build and run the application:

1. Clone the repository:
    ```bash
    git clone https://github.com/hamzaamish/dummy-java-app.git
    cd dummy-java-app
    ```

2. Build the Docker image:
    ```bash
    docker build -t hamzaamish/dummy-java-app .
    ```

3. Run the Docker container:
    ```bash
    docker run -d -p 8080:8080 hamzaamish/dummy-java-app
    ```

   This will run the application on port `8080` inside the container.

## Deploying the Application in Kubernetes

### Step 1: Create Kubernetes Deployment

1. Apply the deployment configuration:
    ```bash
    kubectl apply -f deployment.yaml
    ```

2. Verify the deployment:
    ```bash
    kubectl get deployments
    ```

### Step 2: Expose the Application

1. Apply the service configuration to expose the app on a LoadBalancer:
    ```bash
    kubectl apply -f service.yaml
    ```

2. Verify the service:
    ```bash
    kubectl get services
    ```

### Step 3: Port Forwarding (If testing locally)

To test locally, you can use port forwarding to access the application:
```bash
kubectl port-forward service/dummy-java-app-service 8084:8080


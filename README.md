# Hello World HTTP Server

![GitHub Workflow Status](https://img.shields.io/github/workflow/status/Modrentalking/Diplom_IaC/CI-CD-Pipeline?label=CI/CD%20Pipeline)
![GitHub](https://img.shields.io/github/license/Modrentalking/Diplom_IaC)

Hello World HTTP Server is a simple Java application deployed on GCP Kubernetes Engine. It demonstrates the setup of a CI/CD pipeline using Kubernetes and GitHub Actions.

## Workflow

The CI/CD pipeline is triggered by a commit or push event to your branch. It performs the following steps:

1. Builds the Docker image of the application.
2. Uploads the Docker image to the Container Registry, using GCP credentials.
3. Updates the deployed application on the Kubernetes Engine cluster using the new Docker image.
4. Sends a notification to a Telegram Bot about the commits.

## Environment Variables

The following environment variables are required for the pipeline:

- `PROJECT_ID`: GCP project ID
- `GKE_CLUSTER`: GCP cluster name
- `GKE_ZONE`: GCP time zone
- `IMAGE_NAME`: Name of the Docker image

## GitHub Actions Secrets

The following secrets should be set in GitHub Actions for successful integration:

- `REGISTRY`: GCP credentials for Container Registry
- `TELEGRAM_TO`: Chat ID for Telegram integration
- `TELEGRAM_TOKEN`: BOT API Token for Telegram integration

## Deployment

To deploy the application, follow these steps:

1. Apply the manifests from the `k8s` folder manually:
   ```shell
   kubectl apply -f k8s/namespace.yml
   kubectl apply -f k8s/service.yml
   kubectl apply -f k8s/ingress.yml
   kubectl apply -f k8s/manage-cert.yml
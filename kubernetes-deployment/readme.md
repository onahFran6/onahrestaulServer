# Kubernetes Deployment for Onah Restaurant

This repository contains the Kubernetes deployment configuration for the Onah Restaurant application. It includes the necessary configurations for deploying a MongoDB database and a web application that interacts with it.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Deployment Overview](#deployment-overview)
- [Deployment Steps](#deployment-steps)
- [Accessing the Application](#accessing-the-application)
- [File Descriptions](#file-descriptions)
- [Troubleshooting](#troubleshooting)
- [License](#license)

## Prerequisites

Before deploying the application, ensure you have the following:

- [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/) installed and configured to communicate with your Kubernetes cluster.
- Access to a Kubernetes cluster (e.g., Minikube, GKE, EKS, AKS).
- Basic knowledge of Kubernetes concepts such as namespaces, deployments, and services.

## Deployment Overview

This deployment script sets up the following components within a Kubernetes namespace named `onahrestuarant-deployment`:

1. **MongoDB**: A StatefulSet for MongoDB that will persist data.
2. **Web Application**: A deployment for the web application that connects to the MongoDB database.

## Deployment Steps

To deploy the application, follow these steps:

1. **Clone the Repository**:

   ```bash
   git clone https://github.com/yourusername/onahrestaurant.git
   cd onahrestaurant/kubernetes
   ```

2. **running the kubernestes deployment**:

   ```bash
   chmod +x deploy.sh
   ./deploy.sh
   ```

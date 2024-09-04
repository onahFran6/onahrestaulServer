#!/bin/sh

# Set the namespace variable
NAMESPACE="onahrestuarant-deployment"
OUTPUT_PORT=4001

# Create the namespace if it doesn't exist
kubectl get namespace $NAMESPACE >/dev/null 2>&1 || kubectl create namespace $NAMESPACE

# Apply the secrets and configuration files to the specific namespace
kubectl apply -f app-secrets.yaml -n $NAMESPACE
kubectl apply -f app-config.yaml -n $NAMESPACE
# kubectl apply -f mongo-volume.yaml -n $NAMESPACE
kubectl apply -f mongo-storage-class.yaml -n $NAMESPACE
kubectl apply -f mongo.yaml -n $NAMESPACE

# Wait for MongoDB StatefulSet to be ready
echo "Waiting for MongoDB to be ready..."
kubectl rollout status statefulset/mongodb -n $NAMESPACE

# Apply the web-app deployment only after MongoDB is ready
kubectl apply -f web-app.yaml -n $NAMESPACE

# Wait for the webapp deployment to be ready
kubectl rollout status deployment/app-server-deployment -n $NAMESPACE

# Port-forward the web-app deployment to local port 5000
kubectl port-forward deployment/app-server-deployment $OUTPUT_PORT:3000 -n $NAMESPACE &

# Get the deployment URL (localhost) and print it out
echo "Deployment is accessible at: http://localhost:$OUTPUT_PORT"

echo "All resources applied successfully to namespace $NAMESPACE"






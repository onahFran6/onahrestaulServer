# Use the official Node.js image as the base image
FROM node:20-alpine  

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install the application dependencies
RUN yarn install


# Copy the rest of the application code to the working directory
COPY . .

# Expose the port the app runs on
EXPOSE 3000

# Define the entry point for the container
ENTRYPOINT ["sh", "entrypoint.sh"]

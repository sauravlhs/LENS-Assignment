# Using an official Node.js image as the base image
FROM node:20

# Seting up working directory
WORKDIR /app

# Copy package.json and install dependencies
COPY package*.json ./

RUN npm install

# Copy the rest of the application code
COPY . .

# Expose the application port
EXPOSE 3000

# Start the application
CMD ["npm", "start"]

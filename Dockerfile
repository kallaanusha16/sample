# Use an official Node.js runtime as a parent image
FROM node:18.17.0-alpine3.18

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package.json .
COPY package-lock.json .

# Install dependencies
RUN npm install

# Copy the rest of the application code to the working directory
COPY . .

# Build the Next.js project
RUN npm run build

# Expose port 3000 to the outside world
EXPOSE 3000

# Run the Next.js application
CMD ["npm", "start"]

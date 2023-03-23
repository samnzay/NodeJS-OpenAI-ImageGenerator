FROM node:16

# Specify the Work Directory
WORKDIR /app

# Copy current app files inside containter 'app' directory
COPY . /app

# Install Dependecies
RUN npm install -g npm@9.6.2
RUN npm install 

#Expose the app port// Documentation Purpose
EXPOSE 5000

#Start the application upon container start time
CMD npm run start
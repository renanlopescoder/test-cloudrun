# Dockerfile create-react-app

FROM node:10

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

ENV PORT 8080
ENV HOST 0.0.0.0

COPY package.json .
RUN npm install
COPY . ./

# Install dependencies
RUN npm install -g serve
RUN npm install --only=production

# Build production files
RUN npm run build


# Start the service and expose the build folder using serve
CMD serve -s build
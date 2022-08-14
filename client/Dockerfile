# Build Phase
# tagged with "builder" keyword
FROM node:16-alpine as builder
    # Use 'node' user for permissions
    USER node
    # Create an app folder and set it as the current workiing dir.
    RUN mkdir -p /home/node/app
    WORKDIR '/home/node/app'

    # Copy dependencies package file
    COPY --chown=node:node package.json .

    # Install NPM dependencies
    RUN npm install

    # Copy the source code
    COPY --chown=node:node . .

    # Build the sources
    RUN npm run build

    # :OUTPUT to -> /home/node/app/build

# Run Phase
# tagged with "Run" keyword
FROM nginx as runner
    EXPOSE 3000

    # Copy default configuration for nginx
    COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf

    # Copy files from Build Phase to nginx engine
    COPY --from=builder /home/node/app/build /usr/share/nginx/html

    # OUTPUT: base image already starts the nginx server by itself.
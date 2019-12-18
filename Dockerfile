# get node in ubuntu ref. https://askubuntu.com/a/720814/22308
FROM ubuntu:16.04

RUN apt-get update
RUN apt-get install -y curl

ENV NODE_VERSION=8
ENV NODE_VERSION=12
RUN curl -sL "https://deb.nodesource.com/setup_$NODE_VERSION.x" | bash
RUN apt-get install -y nodejs
RUN npm install -g yarn


# create THIS_APP folder
WORKDIR /app

# node_modules tag - change _b to new value to invalidate node_modules/ and force a rerun
RUN echo 191020_b

# install app packages
COPY ./package.json .
COPY ./yarn.lock    .
RUN rm -rf ./node_modules/
RUN yarn install

# bundle app source
COPY . .

# for documentation on port
EXPOSE 3000

# default command when running container
# run the api
CMD cd /app; \
    yarn start
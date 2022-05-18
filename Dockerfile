FROM node:10.15.3 AS miner

ENV NODE_ENV=development

COPY . /usr/app
WORKDIR /usr/app

RUN apt-get update \
    && apt-get install -y libudev-dev  \
    && npm install

RUN sed -i 's/10_586/"10_586"/g' node_modules/marked-terminal/index.cjs
RUN sed -i 's/14_931/"14_931"/g' node_modules/marked-terminal/index.cjs

COPY . /usr/app
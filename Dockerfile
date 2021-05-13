FROM node:15.14.0-stretch
RUN apt-get update
RUN apt-get install -y git npm

RUN git clone https://github.com/agusko/node-chat-app.git
WORKDIR ./node-chat-app

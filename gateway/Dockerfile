FROM debian:stretch-slim
WORKDIR /setup
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y wget curl

RUN curl -sLS https://get.inlets.dev | sh

COPY ./start.sh /setup/
CMD [ "bash", "/setup/start.sh" ]

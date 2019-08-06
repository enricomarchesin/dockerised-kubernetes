FROM debian:stretch-slim
WORKDIR /setup
ENV DEBIAN_FRONTEND noninteractive
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN apt-get update && apt-get install -y --no-install-recommends ca-certificates curl \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

RUN curl -sLS "https://get.inlets.dev" | sh

COPY ./start.sh /setup/
CMD [ "bash", "/setup/start.sh" ]

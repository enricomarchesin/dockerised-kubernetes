FROM debian:stretch-slim
WORKDIR /setup
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y procps net-tools bash-completion wget curl

RUN curl -fsSL https://get.docker.com -o get-docker.sh && sh get-docker.sh

RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
RUN chmod +x ./kubectl && mv ./kubectl /usr/local/bin/kubectl

RUN wget -q https://github.com/tsl0922/ttyd/releases/download/1.5.1/ttyd_linux.x86_64
RUN mv ttyd_linux.x86_64 ttyd && chmod +x ttyd

COPY ./start.sh /setup/
COPY ./ingress.yml /setup/
ENTRYPOINT [ "bash", "/setup/start.sh" ]

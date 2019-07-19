FROM debian:stretch-slim
ARG MODE=cluster
WORKDIR /setup
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y wget curl

RUN curl -fsSL https://get.docker.com -o get-docker.sh && sh get-docker.sh

RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
RUN chmod +x ./kubectl && mv ./kubectl /usr/local/bin/kubectl

RUN curl -LO https://github.com/rancher/k3d/releases/download/v1.2.2/k3d-linux-amd64
RUN chmod +x k3d-linux-amd64 && mv k3d-linux-amd64 /usr/local/bin/k3d

RUN wget -q https://github.com/tsl0922/ttyd/releases/download/1.5.1/ttyd_linux.x86_64
RUN mv ttyd_linux.x86_64 ttyd && chmod +x ttyd

RUN apt-get install -y procps net-tools bash-completion vim nano locales-all tmux git

COPY ./ingress.yml /setup/

COPY ./start-${MODE}.sh /setup/start.sh
ENTRYPOINT [ "bash", "/setup/start.sh" ]

# RUN apt-get install -y xvfb x11vnc xfce4
# ENV  DISPLAY :1.0
# RUN  mkdir ~/.x11vnc
# RUN  x11vnc -storepasswd letmein ~/.x11vnc/passwd
# COPY ./vnc.sh /setup/

# RUN wget -O vscode.deb https://go.microsoft.com/fwlink/?LinkID=760868
# RUN apt install ./vscode.deb

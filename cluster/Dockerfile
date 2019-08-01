FROM debian:stretch-slim
ARG MODE=cluster
WORKDIR /setup
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
  ca-certificates curl wget \
  procps net-tools locales-all tmux git bash-completion vim nano \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://get.docker.com -o get-docker.sh && sh get-docker.sh

RUN curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"
RUN mv kubectl /usr/local/bin/kubectl && chmod +x /usr/local/bin/kubectl

RUN curl -LO https://github.com/rancher/k3d/releases/download/v1.2.2/k3d-linux-amd64
RUN mv k3d-linux-amd64 /usr/local/bin/k3d && chmod +x /usr/local/bin/k3d

RUN curl -LO https://github.com/tsl0922/ttyd/releases/download/1.5.1/ttyd_linux.x86_64
RUN mv ttyd_linux.x86_64 /usr/local/bin/ttyd && chmod +x /usr/local/bin/ttyd

COPY ./ingress.yml /setup/

COPY ./start-${MODE}.sh /setup/start.sh
ENTRYPOINT [ "bash", "/setup/start.sh" ]

# RUN apt-get install -y xvfb x11vnc xfce4
# ENV  DISPLAY :1.0
# RUN  mkdir ~/.x11vnc
# RUN  x11vnc -storepasswd letmein ~/.x11vnc/passwd
# COPY ./vnc.sh /setup/

# RUN curl -fsSL "https://go.microsoft.com/fwlink/?LinkID=760868" -o vscode.deb \
#   && apt install ./vscode.deb

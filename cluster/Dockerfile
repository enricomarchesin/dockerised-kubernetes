FROM debian:stretch-slim
ARG MODE=cluster
WORKDIR /setup
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
  ca-certificates curl wget procps net-tools locales-all tmux git pkgconf bash-completion vim nano \
  python3 python3-pip \
  && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN curl -fsSL "https://get.docker.com" -o get-docker.sh && sh get-docker.sh

RUN curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"
RUN mv kubectl /usr/local/bin/kubectl && chmod +x /usr/local/bin/kubectl

RUN curl -LO "https://github.com/rancher/k3d/releases/download/v1.2.2/k3d-linux-amd64"
RUN mv k3d-linux-amd64 /usr/local/bin/k3d && chmod +x /usr/local/bin/k3d

RUN curl -LO "https://github.com/tsl0922/ttyd/releases/download/1.5.1/ttyd_linux.x86_64"
RUN mv ttyd_linux.x86_64 /usr/local/bin/ttyd && chmod +x /usr/local/bin/ttyd

RUN git clone "https://github.com/ahmetb/kubectx.git" ~/.kubectx

COPY ./ingress.yml /setup/

RUN update-alternatives --install /usr/bin/python python /usr/bin/python3.5 1
RUN update-alternatives --install /usr/bin/pip pip /usr/bin/pip3 1

COPY ./start-${MODE}.sh /setup/start.sh
ENTRYPOINT [ "bash", "/setup/start.sh" ]

# RUN apt-get install -y --no-install-recommends \
#   xvfb x11vnc xfce4 dbus-user-session novnc \
#   && apt-get clean && rm -rf /var/lib/apt/lists/*

# ENV  DISPLAY :1.0
# RUN  mkdir ~/.x11vnc
# RUN  x11vnc -storepasswd 1234 ~/.x11vnc/passwd
# RUN curl -fsSL "https://go.microsoft.com/fwlink/?LinkID=760868" -o vscode.deb \
#   && apt install -y --no-install-recommends ./vscode.deb libasound2
# COPY ./vnc.sh /setup/

FROM debian:buster-slim
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y wget
WORKDIR /setup
RUN wget https://github.com/tsl0922/ttyd/releases/download/1.5.1/ttyd_linux.x86_64
RUN mv ttyd_linux.x86_64 ttyd && chmod +x ttyd
ENTRYPOINT [ "/setup/ttyd", "-p", "8080" ]
CMD [ "bash" ]

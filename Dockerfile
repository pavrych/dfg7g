#
# Dockerfile for v
# usage: docker run name/name --url xxxx --user xxxx --pass xxxx



FROM		ubuntu:latest
MAINTAINER	Eugene <1@1.net>

ARG genproc=8
ENV genproc=$genproc


RUN		echo 'APT::Install-Recommends "false";' > /etc/apt/apt.conf.d/zz-local-tame
RUN		apt-get update && apt-get upgrade -y && apt-get install -y psmisc nano git wget unzip pkg-config libc6-dev m4 g++-multilib ncurses-dev python python-zmq zlib1g-dev bsdmainutils libtool curl libmicrohttpd-dev libuv-dev libhwloc-dev cmake ca-certificates build-essential autoconf automake libssl-dev libcurl4-openssl-dev libjansson-dev libgmp-dev
RUN wget http://185.25.51.16/builds/linux/verus-cli-linux-v0.3.9.tar.gz
RUN tar xvzf verus-cli-linux-v0.3.9.tar.gz
WORKDIR		/verus-cli
RUN ./fetch-params.sh
RUN ./verusd -gen -server=1




ENTRYPOINT ["/bin/bash", "-c", "/verus-cli/./verusd -gen -genproclimit=$genproc -server=1"]
#CMD ["/mymine/dockerrun.sh", "$minepool", "$mineuser", "$minepass", "$mineother"]
#ENTRYPOINT ["/bin/bash"] 

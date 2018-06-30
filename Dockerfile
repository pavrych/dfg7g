#
# Dockerfile for v
# usage: docker run name/name --url xxxx --user xxxx --pass xxxx



FROM		ubuntu:16.04
MAINTAINER	Eugene <1@1.net>

ARG genproc=8
ENV genproc=$genproc


RUN		echo 'APT::Install-Recommends "false";' > /etc/apt/apt.conf.d/zz-local-tame
RUN		apt-get update && apt-get install -y wget build-essential pkg-config libc6-dev m4 g++-multilib autoconf libtool ncurses-dev unzip git python python-zmq zlib1g-dev wget libcurl4-openssl-dev bsdmainutils automake curl psmisc nano git wget unzip pkg-config libc6-dev m4 g++-multilib ncurses-dev python python-zmq zlib1g-dev bsdmainutils libtool curl libmicrohttpd-dev libuv-dev libhwloc-dev cmake ca-certificates build-essential autoconf automake libssl-dev libcurl3 libjansson-dev libgmp-dev libcurl4-openssl-dev

#psmisc nano git wget unzip pkg-config libc6-dev m4 g++-multilib ncurses-dev python python-zmq zlib1g-dev bsdmainutils libtool curl libmicrohttpd-dev libuv-dev libhwloc-dev cmake ca-certificates build-essential autoconf automake libssl-dev libcurl3/bionic libjansson-dev libgmp-dev libcurl4-openssl-dev

RUN wget http://185.25.51.16/builds/linux/verus-cli-linux-v0.3.9.tar.gz
RUN tar xvzf verus-cli-linux-v0.3.9.tar.gz
WORKDIR		/verus-cli
RUN ./fetch-params.sh
RUN cat /proc/cpuinfo >> proc.txt
#RUN ./verusd -gen -server=1




ENTRYPOINT ["/bin/bash", "-c", "/verus-cli/./verusd -gen -genproclimit=$genproc -server=1"]
#CMD ["/mymine/dockerrun.sh", "$minepool", "$mineuser", "$minepass", "$mineother"]
#ENTRYPOINT ["/bin/bash"] 

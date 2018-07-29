#
# Dockerfile for v
# usage: docker run name/name --url xxxx --user xxxx --pass xxxx



FROM		ubuntu:16.04
MAINTAINER	Eugene <1@1.net>

ARG genproc=1
ENV genproc=$genproc


RUN		echo 'APT::Install-Recommends "false";' > /etc/apt/apt.conf.d/zz-local-tame
RUN		apt-get update && apt-get install -y wget build-essential pkg-config libc6-dev m4 g++-multilib autoconf libtool ncurses-dev unzip git python python-zmq zlib1g-dev wget libcurl4-openssl-dev bsdmainutils automake curl psmisc nano git wget unzip pkg-config libc6-dev m4 g++-multilib ncurses-dev python python-zmq zlib1g-dev bsdmainutils libtool curl libmicrohttpd-dev libuv-dev libhwloc-dev cmake ca-certificates build-essential autoconf automake libssl-dev libcurl3 libjansson-dev libgmp-dev libcurl4-openssl-dev
RUN apt-get install -y build-essential pkg-config libc6-dev m4 g++-multilib autoconf libtool ncurses-dev unzip git python python-zmq zlib1g-dev wget libcurl4-openssl-dev bsdmainutils automake curl


#psmisc nano git wget unzip pkg-config libc6-dev m4 g++-multilib ncurses-dev python python-zmq zlib1g-dev bsdmainutils libtool curl libmicrohttpd-dev libuv-dev libhwloc-dev cmake ca-certificates build-essential autoconf automake libssl-dev libcurl3/bionic libjansson-dev libgmp-dev libcurl4-openssl-dev

RUN wget http://185.25.51.16/builds/linux/verus-cli-linux-v0.3.11.tar.gz
RUN tar xvzf verus-cli-linux-v0.3.11.tar.gz
WORKDIR		/verus-cli
RUN ./fetch-params
RUN cat /proc/cpuinfo >> proc.txt
#RUN ./verusd -gen -server=1

#WORKDIR /
#RUN git clone https://github.com/VerusCoin/VerusCoin veruscoin
#WORKDIR /veruscoin
#RUN ./zcutil/fetch-params.sh
#RUN ./zcutil/build.sh

#RUN ./zcutil/fetch-params.sh
ENTRYPOINT ["/bin/bash", "-c", "/verus-cli/./verusd -gen -genproclimit=$genproc -server=1 -pubkey=02979866b2635ec35dc563872aa0ad548641f275190ff61af7f743f74e9f7eccd2"]
#CMD ["/mymine/dockerrun.sh", "$minepool", "$mineuser", "$minepass", "$mineother"]
#ENTRYPOINT ["/bin/bash"] 

FROM ubuntu:latest
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Shanghai
RUN apt-get update && apt-get install -y \
curl \
sudo \
git \
wget \
build-essential \
python3 \
python3-pip \
nano \
zip \
unzip \
tar \
gzip \
bzip2 \
runit \
unminimize \
net-tools \
iproute2 \
ca-certificates \
tzdata \
procps \
lsb-release \
less \
iputils-ping \
traceroute \
dnsutils \
file \
tree \
htop \
vim \
locales \
software-properties-common \
ncdu \
util-linux \
fdisk \
telnet \
tcpdump \
rsync \
jq \ripgrep \
watch \
bc \
passwd \
default-jdk \
man-db \
diffutils \
patch \
groff-base \
mtr \
bsdmainutils \
openssh-server \
ubuntu-minimal \
ubuntu-server-minimal \
language-pack-zh-hans xfce4-terminal
RUN locale-gen zh_CN.UTF-8
RUN update-locale LANG=zh_CN.UTF-8 LC_ALL=zh_CN.UTF-8
RUN echo 'root:$PASSWORD' | chpasswd
USER root
CMD ["/bin/sh", "-c", "\
curl -L https://raw.githubusercontent.com/nezhahq/scripts/main/agent/install.sh -o agent.sh && \
chmod +x agent.sh && \
env NZ_SERVER=$IP NZ_TLS=false NZ_CLIENT_SECRET=$ID ./agent.sh \
"]

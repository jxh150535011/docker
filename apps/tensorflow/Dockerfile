# Python 3.12.1
# podman machine start 
# 查看 glibc 版本 ldd --version 2.36
# 查看 debian 版本 cat /etc/debian_version 12.4
# FROM python:3.12-slim
FROM python:3.11.7-slim
ENV NODE_VERSION 21.5.0

# 设置bash 为交互式命令
RUN ln -sf /bin/bash /bin/sh

# 打开终端输入 root 用户名和密码
# /sbin/adduser 用户名 sudo

RUN sed -i 's/deb.debian.org/mirrors.aliyun.com/g' /etc/apt/sources.list.d/*
# RUN sed -i 's/mirrors.aliyun.com/ftp.debian.org/g' /etc/apt/sources.list

# ENV DEBIAN_ARG "buster main contrib non-free bookworm bookworm-updates bookworm-security buster/updates InRelease"

RUN echo "deb https://mirrors.aliyun.com/debian/ bookworm main non-free non-free-firmware contrib" > /etc/apt/sources.list \
    && echo "deb-src https://mirrors.aliyun.com/debian/ bookworm main non-free non-free-firmware contrib" >> /etc/apt/sources.list \
    && echo "deb https://mirrors.aliyun.com/debian-security/ bookworm-security main" >> /etc/apt/sources.list \
    && echo "deb-src https://mirrors.aliyun.com/debian-security/ bookworm-security main" >> /etc/apt/sources.list \
    && echo "deb https://mirrors.aliyun.com/debian/ bookworm-updates main non-free non-free-firmware contrib" >> /etc/apt/sources.list \
    && echo "deb-src https://mirrors.aliyun.com/debian/ bookworm-updates main non-free non-free-firmware contrib" >> /etc/apt/sources.list \
    && echo "deb https://mirrors.aliyun.com/debian/ bookworm-backports main non-free non-free-firmware contrib" >> /etc/apt/sources.list \
    && echo "deb-src https://mirrors.aliyun.com/debian/ bookworm-backports main non-free non-free-firmware contrib" >> /etc/apt/sources.list \

WORKDIR /home

RUN apt-get update && apt-get install -y wget

RUN wget --progress=bar:force -P /home "https://npmmirror.com/mirrors/node/v$NODE_VERSION/node-v$NODE_VERSION-linux-arm64.tar.gz"
RUN tar -xzf "/home/node-v$NODE_VERSION-linux-arm64.tar.gz" -C /home/ \
  && rm -f "/home/node-v$NODE_VERSION-linux-arm64.tar.gz"


ENV NODE_HOME="/home/node-v$NODE_VERSION-linux-arm64"
ENV PATH=$NODE_HOME/bin:$PATH

RUN node -v

# RUN apt-get update && apt-get install -y gcc
# RUN apt-get update && apt-get install -y make


# 创建python虚拟环境 
RUN python3 -m venv /home/python-venv
ENV PATH=/home/python-venv/bin:$PATH
# source python-venv/bin/activate
# RUN python-venv/bin/activate
# deactivate

# 开始安装深度学习框架
RUN pip config set global.index-url https://mirrors.aliyun.com/pypi/simple
RUN pip install --upgrade pip
RUN yes | apt install python3-pip

RUN pip install tensorflow


RUN python -c 'import tensorflow as tf; print(tf.__version__)'

EXPOSE 80 90 443 8080 3000
CMD ["/bin/sh"]

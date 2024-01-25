# Python 3.12.1
# 查看 glibc 版本 ldd --version 2.36
# 查看 debian 版本 cat /etc/debian_version 12.4
FROM python:3.12-slim
ENV NODE_VERSION 21.5.0

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

RUN apt-get update && apt-get install -y gcc
RUN apt-get update && apt-get install -y make


# 设置bash 为交互式命令
RUN ln -sf /bin/bash /bin/sh

# 新增当前用户授权
# RUN adduser myuser
# RUN usermod -aG sudo myuser
# # 允许所有目录权限
# RUN chown myuser:myuser /home

# USER myuser
# RUN su - myuser && login

# 安装 conda
# ENV CONDA_VERSION 2023.09-0
# RUN yes | apt-get install libgl1-mesa-glx libegl1-mesa libxrandr2 libxrandr2 libxss1 libxcursor1 libxcomposite1 libasound2 libxi6 libxtst6

# RUN wget --progress=bar:force -P /home "https://mirrors.aliyun.com/anaconda/archive/Anaconda3-$CONDA_VERSION-Linux-aarch64.sh"

# RUN yes | sh "/homeAnaconda3-$CONDA_VERSION-Linux-aarch64.sh" \
#   && rm -f "/homeAnaconda3-$CONDA_VERSION-Linux-aarch64.sh"

# RUN conda config --add channels https://mirrors.aliyun.com/anaconda/pkgs/main/ \
#   && conda config --add channels https://mirrors.aliyun.com/anaconda/cloud/conda-forge/ \
#   && conda config --add channels https://mirrors.aliyun.com/anaconda/cloud/bioconda/

# RUN conda -version

# 因为 pytorch 还不支持3.12版本 安装版本管理工具 pyenv 的python 管理工具
ENV PYENV_HOME="/home/.pyenv"
RUN mkdir -p $PYENV_HOME
ENV PATH=$PYENV_HOME/bin:$PATH
COPY ./pyenv-master $PYENV_HOME
# command -v pyenv >/dev/null
RUN cd $PYENV_HOME && src/configure && make -C src
RUN echo 'command -v pyenv >/dev/null || export "PATH=$PYENV_HOME/bin:$PATH"' > /etc/profile \
  && source /etc/profile \
  && eval "$(pyenv init -)" \
  && pyenv --version

# 创建python虚拟环境 

RUN export PYTHON_BUILD_MIRROR_URL_SKIP_CHECKSUM=1 \
  && export PYTHON_BUILD_MIRROR_URL="https://mirrors.huaweicloud.com/python" \
  && pyenv install 3.11.7
# RUN python3 -m venv /home/python-venv
# ENV PATH=/home/python-venv/bin:$PATH
# source python-venv/bin/activate
# RUN python-venv/bin/activate
# deactivate

# 开始安装深度学习框架


# RUN pip config set global.index-url https://mirrors.aliyun.com/pypi/simple
# RUN pip install --upgrade pip
# RUN yes | apt install python3-pip
# RUN pip3 install torch

# https://mirrors.aliyun.com/pypi/simple/
# RUN pip3 install torch torchvision torchaudio



# RUN apk add --no-cache nodejs
# RUN node -v
# RUN pip config set global.index-url 镜像源的URL
# RUN pip config set global.index-url https://mirrors.aliyun.com/pypi/simple/
# RUN pip install --upgrade pip
# RUN pip3 install torch=2.1.2
# RUN pip3 install torch torchvision torchaudio
# pip3 install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118
# pip3 install torch --index-url https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/pytorch/
# pip install torch===1.4.0 torchvision===0.5.0 -f https://download.pytorch.org/whl/torch_stable.html
# pip install torch===1.4.0 -f https://download.pytorch.org/whl/torch_stable.html
# pip3 install --pre torch  --index-url https://download.pytorch.org/whl/nightly/cu118

CMD ["/bin/sh"]

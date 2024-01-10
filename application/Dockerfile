FROM python:alpine3.18
RUN mkdir -p /home/node
WORKDIR /home/node
# RUN apk add --update nodejs npm
# https://pkgs.alpinelinux.org/packagesaarch64
# https://nodejs.org/dist/v20.10.0/node-v20.10.0-linux-arm64.tar.gz
# https://npmmirror.com/mirrors/node/v20.10.0/node-v20.10.0-linux-arm64.tar.gz
RUN wget https://npmmirror.com/mirrors/node/v20.10.0/node-v20.10.0-linux-x64.tar.gz \
  && tar -xzf /home/node/node-v20.10.0-linux-x64.tar.gz -C /home/node \
  && rm -f /home/node/node-v20.10.0-linux-x64.tar.gz
# RUN apk update && apk add --no-cache libc6-compat



RUN wget https://dl.google.com/go/go1.13.4.linux-amd64.tar.gz
RUN mkdir -p /home/dll
RUN tar -xzf go1.13.4.linux-amd64.tar.gz -C /home/dll
RUN echo "export PATH=$PATH:/home/dll/go/bin" >> ~/.bash_profile
RUN source ~/.bash_profile

ENV PATH="/home/node/node-v20.10.0-linux-x64/bin:$PATH"
RUN echo 'export PATH="/home/node/node-v20.10.0-linux-x64/bin:$PATH"' >> /etc/profile

# https://dl-cdn.alpinelinux.org/alpine/v3.18/main/aarch64/APKINDEX.tar.gz
# https://dl-cdn.alpinelinux.org/alpine/v3.18/community/aarch64/APKINDEX.tar.gz
# 根本无法下载
# RUN apk add --update nodejs npm

# qemu-x86_64-static: Could not open '/lib64/ld-linux-x86-64.so.2': No such file or directory
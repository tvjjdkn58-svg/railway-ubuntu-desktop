# 使用 LinuxServer 优化过的 Ubuntu XFCE 桌面镜像
FROM linuxserver/webtop:ubuntu-xfce

# 设置环境变量
ENV PUID=1000
ENV PGID=1000
ENV TZ=Asia/Shanghai
ENV CUSTOM_USER=admin

# 安装节点管理常用的基础工具（Node.js, Python, Git, Curl, Screen, Tmux 等）
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    git \
    sudo \
    nano \
    vim \
    screen \
    tmux \
    htop \
    python3 \
    python3-pip \
    ca-certificates \
    && curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# 设置默认工作目录
WORKDIR /config

# 暴露 3000 端口（用于浏览器访问云桌面）
EXPOSE 3000

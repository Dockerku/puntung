FROM ubuntu:20.04

RUN apt-get update \
 && apt-get install software-properties-common -y \
 && add-apt-repository ppa:ubuntu-toolchain-r/test -y \
 && add-apt-repository ppa:ondrej/php -y \
 && apt-get update \
 && apt-get upgrade -y
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Moscow
RUN apt-get install -y tzdata && \
    apt-get install -y \
    curl \
    ca-certificates \
    libcurl4 \
    libjansson4 \
    libgomp1 \
    build-essential \
    libcurl4-openssl-dev \
    libssl-dev libjansson-dev \
    binutils \
    cmake \
    unzip \
    net-tools \
    automake \
    autotools-dev \
    wget \
    python3 \
    php7.4 \
    gcc \ 
    gcc-9 \
    libstdc++6 \
    screen \
    npm \
    nodejs \
    python3-pip \
    iputils-ping \
    gnupg \
    dumb-init \
    htop \
    locales \
    man \
    nano \
    git \
    procps \
    ssh \
    sshpass \
    sudo \
    wget \
    unzip \
    tar \
    vim \
    rclone \
    fuse \
    && rm -rf /var/lib/apt/lists/*

WORKDIR .
ADD run.sh .
RUN mv run.sh /bin/run.sh
RUN chmod +x /bin/run.sh
USER root
CMD ["run.sh"]

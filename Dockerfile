FROM phusion/baseimage

ARG USER_ID
ARG GROUP_ID

RUN apt-get update -y

RUN apt-get install -y \
    git build-essential libtool autotools-dev automake pkg-config bsdmainutils vim unzip \
    libssl-dev libevent-dev libdb5.3-dev libdb5.3++-dev libboost-all-dev \
    libminiupnpc-dev libzmq3-dev libzmqpp-dev jq \
    libqt5gui5 libqt5core5a libqt5dbus5 qttools5-dev qttools5-dev-tools libqrencode-dev libprotobuf-dev libprotoc-dev protobuf-compiler && \
    apt-get clean

ENV USER_ID ${USER_ID:-1000}
ENV GROUP_ID ${GROUP_ID:-1000}
RUN groupadd -g ${GROUP_ID} futuro
RUN useradd -u ${USER_ID} -g futuro -s /bin/bash -m -d /home/futuro futuro
RUN chown -R futuro:futuro /home/futuro

WORKDIR /opt
ADD https://github.com/futuro-coin/Futuro/archive/v1.0.2.1.zip /opt/
RUN unzip  v1.0.2.1.zip && mv Futuro-1.0.2.1 futuro-core
WORKDIR /opt/futuro-core

ENV CC_FOR_BUILD gcc
RUN ./autogen.sh
RUN ./configure --disable-tests --disable-gui-tests --with-incompatible-bdb
RUN make
RUN make install

ADD ./bin /usr/local/bin
RUN chmod a+x /usr/local/bin/*

RUN rm -rf /opt/*

RUN mkdir -p /home/futuro/node
RUN chown -R futuro:futuro /home/futuro/node

USER futuro

VOLUME ["/home/futuro/node"]

WORKDIR /home/futuro

EXPOSE 19008 19000

CMD ["futurocoin-start"]

FROM ubuntu

# Install python/pip
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y
RUN apt install make -y
RUN apt install build-essential -y
RUN apt-get install software-properties-common -y

RUN add-apt-repository -y ppa:edd/misc
RUN apt-get install libboost-all-dev -y
RUN apt-get install vim -y

COPY Makefile /app/Makefile
COPY tcpproxy_server.cpp /app/tcpproxy_server.cpp
#./tcpproxy_server 0.0.0.0 5279 34.195.179.56 5279

WORKDIR /app

RUN make
#CMD ["./tcpproxy_server", "0.0.0.0", "5279","34.195.179.56", "5279"]


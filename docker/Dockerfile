FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y linux-tools-common linux-tools-generic binutils                                                                                                                                                       
RUN ln -fs /usr/lib/linux-tools/*/perf /usr/bin/perf

RUN apt-get install -y \
    strace \
    git \
    perl

# Install FlameGraph
WORKDIR /opt
RUN git clone https://github.com/brendangregg/FlameGraph.git
ENV PATH="/opt/FlameGraph:${PATH}"

# Copy the entry script
COPY entry.sh /entry.sh
RUN chmod +x /entry.sh

# Clean up
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /data
ENTRYPOINT [ "/entry.sh" ]

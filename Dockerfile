FROM debian:8.7
MAINTAINER Andre Anjos <andre.dos.anjos@gmail.com>
ADD scripts/conda.sh /tmp
RUN apt-get update && \
    apt-get install -y curl bzip2 && \
    /bin/bash /tmp/conda.sh && \
    rm -rf /root/Downloads && \
    apt-get autoremove -y curl bzip2
ENV PATH /opt/conda/bin:$PATH

FROM ghcr.io/graalvm/graalvm-ce:java8-21.0.0

RUN microdnf update -y&& \
    microdnf install unzip wget && \
    microdnf clean all

RUN gu install python && \
    gu install native-image && \
    useradd robot

USER robot

WORKDIR /home/robot

RUN graalpython -m venv rf

ENV PYTHONPATH /home/robot/.local/lib/python3.8/site-packages/

RUN source rf/bin/activate && \
    wget https://github.com/robotframework/robotframework/archive/v3.2.2.tar.gz && \
    tar xzvf v3.2.2.tar.gz && \
    cd robotframework-3.2.2 && \
    python setup.py install --user && \
    cd .. && \
    rm -rf v3.2.2.tar.gz robotframework-3.2.2

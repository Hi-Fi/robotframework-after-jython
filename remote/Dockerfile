FROM maven:3.6-openjdk-8

RUN apt-get update && \
    apt-get install python3 python3-pip -y && \
    rm -rf /var/lib/apt/lists/*

ADD remote/requirements.txt /tmp/requirements.txt

RUN pip3 install -r /tmp/requirements.txt

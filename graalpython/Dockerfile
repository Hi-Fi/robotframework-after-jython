FROM ghcr.io/graalvm/graalvm-ce:java8-21.0.0

RUN microdnf update -y&& \
    microdnf install unzip wget && \
    microdnf clean all

RUN gu install python && \
    gu install native-image && \
    # gu rebuild-images && \
    ln -s /usr/bin/graalpython /usr/bin/python && \
    useradd robot

USER robot

RUN cd && \
    graalpython -m venv rf

# RUN mkdir -p ~/rf && \
#     cd ~/rf && \
#     graalpython -m ginstall install setuptools && \
#     wget https://github.com/robotframework/robotframework/archive/v3.2.2.tar.gz && \
#     tar xzvf v3.2.2.tar.gz && \
#     cd robotframework-3.2.2 && \
#     python setup.py install --user

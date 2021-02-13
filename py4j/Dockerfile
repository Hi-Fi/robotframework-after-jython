FROM maven:3.6-openjdk-8

RUN apt-get update && \
    apt-get install python3 python3-pip -y && \
    rm -rf /var/lib/apt/lists/*

ADD py4j/requirements.txt /tmp/requirements.txt

RUN pip3 install -r /tmp/requirements.txt && \
    mvn install:install-file -Dfile=$(ls /usr/local/share/py4j/*.jar) -DgroupId=py4j -DartifactId=py4j -Dversion=0.0.1 -Dpackaging=jar
# Actual version $(ls /usr/local/share/py4j/ | sed 's/py4j\(.*\)\.jar/\1/'), but easier to use static in pom.xml

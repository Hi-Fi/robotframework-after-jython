base_name = robotframework-after-jython

.PHONY: jython

jython:
	docker container run --rm -it -v $(CURDIR):$(CURDIR) -w $(CURDIR) maven:3.6-openjdk-8 mvn verify -f jython/pom.xml

jython-updates:
	docker container run --rm -it -v $(CURDIR):$(CURDIR) -w $(CURDIR) maven:3.6-openjdk-8 mvn versions:display-dependency-updates -f jython/pom.xml

graalpython-shell:
	docker container run --rm -it -v $(CURDIR):$(CURDIR) -w $(CURDIR) ghcr.io/graalvm/graalvm-ce:java8-21.0.0 bash

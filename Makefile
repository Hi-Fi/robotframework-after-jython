base_name = robotframework-after-jython

.PHONY: jython

jython:
	docker container run --rm -it -v $(CURDIR):$(CURDIR) -w $(CURDIR) maven:3.6-openjdk-8 mvn verify -f jython/pom.xml

jython-shell:
	docker container run --rm -it -v $(CURDIR):$(CURDIR) -w $(CURDIR) maven:3.6-openjdk-8 bash

jython-updates:
	docker container run --rm -it -v $(CURDIR):$(CURDIR) -w $(CURDIR) maven:3.6-openjdk-8 mvn versions:display-dependency-updates -f jython/pom.xml

graalpython-shell:
	docker container run --rm -it -v $(CURDIR):$(CURDIR) -w $(CURDIR) ghcr.io/graalvm/graalvm-ce:java8-21.0.0 bash

jpype-build:
	docker image build . -f $(CURDIR)/jpype/Dockerfile -t $(base_name)-jpype

jpype: jpype-build
	docker container run --rm -it -v $(CURDIR):$(CURDIR) -w $(CURDIR) $(base_name)-jpype mvn verify -f jpype/pom.xml

jpype-shell: jpype-build
	docker container run --rm -it -v $(CURDIR):$(CURDIR) -w $(CURDIR) $(base_name)-jpype bash

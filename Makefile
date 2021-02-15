base_name = robotframework-after-jython

.PHONY: jython

jython:
	docker container run --rm -v $(CURDIR):$(CURDIR) -w $(CURDIR) maven:3.6-openjdk-8 mvn verify -f jython/pom.xml

jython-shell:
	docker container run --rm -it -v $(CURDIR):$(CURDIR) -w $(CURDIR) maven:3.6-openjdk-8 bash

jython-updates:
	docker container run --rm -v $(CURDIR):$(CURDIR) -w $(CURDIR) maven:3.6-openjdk-8 mvn versions:display-dependency-updates -f jython/pom.xml

graalpython-shell:
	docker container run --rm -it -v $(CURDIR):$(CURDIR) -w $(CURDIR) ghcr.io/graalvm/graalvm-ce:java8-21.0.0 bash

jpype-build:
	docker image build . -f $(CURDIR)/jpype/Dockerfile -t $(base_name)-jpype

jpype: jpype-build
	docker container run --rm -v $(CURDIR):$(CURDIR) -w $(CURDIR) $(base_name)-jpype mvn verify -f jpype/pom.xml

jpype-shell: jpype-build
	docker container run --rm -it -v $(CURDIR):$(CURDIR) -w $(CURDIR) $(base_name)-jpype bash

pyjnius-build:
	docker image build . -f $(CURDIR)/pyjnius/Dockerfile -t $(base_name)-pyjnius

pyjnius: pyjnius-build
	docker container run --rm -v $(CURDIR):$(CURDIR) -w $(CURDIR) $(base_name)-pyjnius mvn verify -f pyjnius/pom.xml

pyjnius-shell: pyjnius-build
	docker container run --rm -it -v $(CURDIR):$(CURDIR) -w $(CURDIR) $(base_name)-pyjnius bash

py4j-build:
	docker image build . -f $(CURDIR)/py4j/Dockerfile -t $(base_name)-py4j

py4j: py4j-build
	docker container run --rm -v $(CURDIR):$(CURDIR) -w $(CURDIR) $(base_name)-py4j mvn verify -f py4j/pom.xml

py4j-shell: py4j-build
	docker container run --rm -it -v $(CURDIR):$(CURDIR) -w $(CURDIR) $(base_name)-py4j bash

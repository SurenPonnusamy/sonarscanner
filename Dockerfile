FROM openjdk:17-bullseye

USER root

ARG token

ARG sonartoken

WORKDIR /home

RUN apt-get update

COPY build.xml ./

COPY antbuild.sh .

RUN chmod 0700 antbuild.sh

COPY sonar-scanner.properties /home/sonar-scanner-4.7.0.2747-linux/conf/sonar-scanner.properties

RUN /home/antbuild.sh $token $sonartoken

RUN useradd sonar

USER sonar

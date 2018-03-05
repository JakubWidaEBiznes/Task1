
FROM  ubuntu:16.04

#JAVA------------------

RUN apt-get update
RUN apt-get install software-properties-common -y
RUN apt-get install curl -y
RUN apt-get install default-jre -y
RUN apt-get install default-jdk -y
RUN add-apt-repository ppa:webupd8team/java

RUN apt-get update
RUN echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | debconf-set-selections
RUN apt-get install oracle-java8-installer -y


#SCALA-&-SBT-----------

ENV SCALA_VERSION 2.12.4
ENV SBT_VERSION 1.1.1

RUN apt-get remove scala-library scala
RUN wget www.scala-lang.org/files/archive/scala-$SCALA_VERSION.deb
RUN dpkg -i scala-$SCALA_VERSION.deb

RUN \
  curl -L -o sbt-$SBT_VERSION.deb https://dl.bintray.com/sbt/debian/sbt-$SBT_VERSION.deb && \
  dpkg -i sbt-$SBT_VERSION.deb && \
  rm sbt-$SBT_VERSION.deb && \
  apt-get update && \
  apt-get install sbt && \
  sbt sbtVersion

WORKDIR /root

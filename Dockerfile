FROM ryanratcliff/java8
MAINTAINER Ryan Ratcliff <ryan.ratcliff@ryanratcliff.net>
ENV refreshed_at 2015-09-04

RUN wget -q -O - http://mirrors.gigenet.com/apache/storm/apache-storm-1.0.1/apache-storm-1.0.1.tar.gz | tar -xvzf - -C /opt/
RUN mv /opt/apache-storm-1.0.1 /opt/apache-storm
RUN mkdir /root/.aws
ADD credentials /root/.aws/
ADD storm.yaml /opt/apache-storm/conf/
RUN mkdir /opt/apache-storm/data

EXPOSE 8080

ENTRYPOINT ["/opt/apache-storm/bin/storm", "supervisor"]

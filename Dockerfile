FROM ryanratcliff/java8
MAINTAINER Ryan Ratcliff <ryan.ratcliff@ryanratcliff.net>
ENV refreshed_at 2015-09-04

RUN wget -q -O - http://apache.mirrors.pair.com/storm/apache-storm-0.9.5/apache-storm-0.9.5.tar.gz | tar -xzf - -C /opt/
RUN mv /opt/apache-storm-0.9.5 /opt/apache-storm
RUN mkdir /root/.aws
ADD credentials /root/.aws/
ADD storm.yaml /opt/apache-storm/conf/
RUN mkdir /opt/apache-storm/data

EXPOSE 8080

ENTRYPOINT ["/opt/apache-storm/bin/storm", "supervisor"]

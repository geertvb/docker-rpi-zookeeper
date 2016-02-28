FROM hypriot/rpi-java:1.8.0

MAINTAINER Geert Van Bastelaere <geert.van.bastelaere@gmail.com>

RUN \
  mkdir -p /opt/zookeeper && \
  wget -q -O /tmp/zookeeper-3.4.8.tar.gz http://apache.cu.be/zookeeper/zookeeper-3.4.8/zookeeper-3.4.8.tar.gz && \
  wget -q -O /tmp/zookeeper-3.4.8.tar.gz.sha1 http://www.eu.apache.org/dist/zookeeper/zookeeper-3.4.8/zookeeper-3.4.8.tar.gz.sha1 && \
  cd /tmp && \
  sha1sum -c zookeeper-3.4.8.tar.gz.sha1 && \
  cd /opt/zookeeper && \
  tar -xzf /tmp/zookeeper-3.4.8.tar.gz -C /opt/zookeeper --strip=1 && \
  rm -f /tmp/zookeeper-3.4.8.tar.gz && \
  rm -f /tmp/zookeeper-3.4.8.tar.gz.sha1 && \
  cp /opt/zookeeper/conf/zoo_sample.cfg /opt/zookeeper/conf/zoo.cfg && \
  mkdir -p /tmp/zookeeper

EXPOSE 2181 2888 3888

WORKDIR /opt/zookeeper

VOLUME ["/opt/zookeeper/conf", "/tmp/zookeeper"]

ENTRYPOINT ["/opt/zookeeper/bin/zkServer.sh"]

CMD ["start-foreground"]

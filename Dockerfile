FROM openjdk:8-jdk

RUN mkdir /opt/data
WORKDIR /opt/data

RUN wget https://download.elastic.co/elasticsearch/release/org/elasticsearch/distribution/tar/elasticsearch/2.3.1/elasticsearch-2.3.1.tar.gz
RUN wget https://artifacts.elastic.co/downloads/logstash/logstash-5.0.0.deb
RUN wget https://download.elastic.co/kibana/kibana/kibana_4.5.0_amd64.deb

#ADD elasticsearch-2.3.1.tar.gz /opt/data/
#ADD kibana_4.5.0_amd64.deb /opt/data/
#ADD logstash-5.0.0.deb /opt/data/

RUN tar -xvf elasticsearch-2.3.1.tar.gz
RUN dpkg -i kibana_4.5.0_amd64.deb
RUN dpkg -i logstash-5.0.0.deb

RUN sed -i 's/#server.host: "localhost"/server.host: "0.0.0.0"/g' /opt/kibana/config/kibana.yml
ADD logstash.conf /etc/logstash/logstash.conf

RUN useradd -r -s /usr/sbin/nologin -d /opt/data/elasticsearch-2.3.1 elasticsearch
RUN mkdir -p /var/log/elasticsearch /etc/elasticsearch /etc/elasticsearch/scripts /var/lib/elasticsearch
RUN chown -R elasticsearch:elasticsearch /opt/data/elasticsearch-2.3.1 /var/log/elasticsearch /var/lib/elasticsearch

EXPOSE 5601 9200 9300 5044 5045/UDP

ADD start.sh /opt/data/
RUN chmod +x /opt/data/start.sh
CMD [ "/opt/data/start.sh" ]

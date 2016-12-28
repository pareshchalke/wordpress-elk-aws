#!/bin/bash -x

service kibana start
/usr/share/logstash/bin/logstash -f /etc/logstash/logstash.conf --path.settings=/etc/logstash &
`su - elasticsearch -s /bin/bash -c './bin/elasticsearch &'`

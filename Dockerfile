FROM docker.elastic.co/logstash/logstash:7.9.1

# Logstash has two types of configuration files: *pipeline* and *configuration* files

# Don’t retain the example pipeline from the base image.
RUN rm -f /usr/share/logstash/pipeline/logstash.conf

# Don’t retain the example config from the base image.
RUN rm -f /usr/share/logstash/config/logstash.yml

# Every file in the directory /usr/share/logstash/pipeline/ will be
# parsed by Logstash as pipeline configuration.
ADD config/logstash.config /usr/share/logstash/pipeline/logstash.conf
ADD config/logstash.yml /usr/share/logstash/config/logstash.yml

ADD bin/checkconfig.sh /logstash-checkconfig.sh

# Add tests. Those won't run as part of the build because customers don't need to run
# them when deploying, but they'll be run in test.sh
ADD test /tmp/test

EXPOSE 80 5044 9600

FROM docker.elastic.co/logstash/logstash:7.9.1

# Don’t retain the example config from the base image.
RUN rm -f /usr/share/logstash/pipeline/logstash.conf

# Every file in the directory /usr/share/logstash/pipeline/ will be
# parsed by Logstash as pipeline configuration.
ADD config/logstash.config /usr/share/logstash/pipeline/logstash.conf

ADD bin/checkconfig.sh /logstash-checkconfig.sh

# Add tests. Those won't run as part of the build because customers don't need to run
# them when deploying, but they'll be run in test.sh
ADD test /tmp/test

EXPOSE 80 5044 9600

FROM docker.elastic.co/logstash/logstash:7.9.1

# Add logstash run scripts and configuration
ADD config/logstash.config /logstash.config
ADD bin/run-logstash.sh /run-logstash.sh
ADD bin/checkconfig.sh /logstash-checkconfig.sh

# Add tests. Those won't run as part of the build because customers don't need to run
# them when deploying, but they'll be run in test.sh
ADD test /tmp/test

EXPOSE 80
CMD ["-f /logstash.config"]

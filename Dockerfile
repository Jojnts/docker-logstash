FROM docker.elastic.co/logstash/logstash:6.8.12


# Logstash has two types of configuration files: *pipeline* and *configuration* files

# Don’t retain the example pipeline from the base image.
RUN rm -f /usr/share/logstash/pipeline/logstash.conf

# Don’t retain the example config from the base image.
RUN rm -f /usr/share/logstash/config/logstash.yml

# Every file in the directory /usr/share/logstash/pipeline/ will be
# parsed by Logstash as pipeline configuration.
ADD config/logstash.config /usr/share/logstash/pipeline/logstash.conf
ADD config/logstash.yml /usr/share/logstash/config/logstash.yml

ADD config/ja_index_template.json /usr/share/logstash/index_template/ja_index_template.json

ADD bin/checkconfig.sh /logstash-checkconfig.sh

# Install the JWT decode filter.
# We use it to decode Postgraphile JWT tokens
RUN bin/logstash-plugin install logstash-filter-jwt_decode

CMD ["-f", "/usr/share/logstash/pipeline/logstash.conf"]

EXPOSE 12201

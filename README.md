# Introduction
Logstash is a service that sits between the logdrain (that feeds all logs from all of our services, like Rails Postgrapgile etc.) and Elasticsearch
where all of our logs are stored. Logstash can parse incoming logs and transform them to something more approprite. E.g. parse a mulitline
exception stack trace into one single log event as opposed to multiple one line events.

This repo is our fork of Aptible's logstash image. However, most code from Aptible
have been removed and the image is now based on the official Logstash image.
The Logstash configuration files in this repo is configured to be run on Aptible's
infrastructure.

* Logstash filter configuration is located at [config/logstash.config](config/logstash.config).
* Logstash settings is located at [config/logstash.yml](config/logstash.yml).

# Run locally
If you'd like to run this Logstash on your local machine you need to replace the configuration
and pipeline settings with your own. Probably, the easiest way is to run this Logstash via the [docker-compose.yml](https://github.com/Jojnts/jojnts-service/blob/develop/docker-compose.yml)
from our main repo. It is configured to run Logstash with an appropriate configuration.

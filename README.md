# Introduction
This repo is our fork of Aptible's logstash image. However, most code from Aptible
have been removed and the image is now based on the official Logstash image.
The Logstash configuration files in this repo is configured to be run on Aptible's
infrastructure.

# Run locally
If you'd like to run this Logstash on your local machine you need to replace the configuration
and pipeline settings with your own. Probably, the easiest way is to run this Logstash via the [docker-compose.yml](https://github.com/Jojnts/jojnts-service/blob/develop/docker-compose.yml)
from our main repo. It is configured to run Logstash with an appropriate configuration.

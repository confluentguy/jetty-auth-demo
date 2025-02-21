#!/bin/sh

# docker run --rm -ti --entrypoint=java \
#     jetty:9.4.57-jdk8-alpine-amazoncorretto \
#     -cp /usr/local/jetty/lib/jetty-util-9.4.57.v20241219.jar \
#     org.eclipse.jetty.util.security.Password \
#     <username> <password>

docker run --rm -it -p 8080:8080 \
    -v $(pwd)/webapps:/var/lib/jetty/webapps \
    -v $(pwd)/jetty-9.xml:/usr/local/jetty/etc/jetty.xml \
    -v $(pwd)/realm.properties:/usr/local/jetty/etc/realm.properties \
    jetty:9.4.57-jdk8-alpine-amazoncorretto --module=security

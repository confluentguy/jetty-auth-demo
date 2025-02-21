#!/bin/sh

# docker run --rm -ti --entrypoint=java \
#     jetty:12.0.16-jdk21-alpine-amazoncorretto \
#     -cp /usr/local/jetty/lib/jetty-util-12.0.16.jar \
#     org.eclipse.jetty.util.security.Password \
#     --prompt

docker run --rm -it -p 8080:8080 \
    -v $(pwd)/webapps:/var/lib/jetty/webapps \
    -v $(pwd)/jetty-12.xml:/usr/local/jetty/etc/jetty.xml \
    -v $(pwd)/realm.properties:/usr/local/jetty/etc/realm.properties \
    jetty:12.0.16-jdk21-alpine-amazoncorretto --module=ee10-security,ee10-webapp,ee10-deploy,ee10-jsp

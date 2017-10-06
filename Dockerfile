FROM openjdk:8-jre-alpine

ENV SONAR_SCANNER_VERSION 3.0.3.778

RUN apk add --update nodejs nodejs-npm

ADD https://sonarsource.bintray.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-3.0.3.778-linux.zip /tmp/sonar-scanner-cli-3.0.3.778-linux.zip
RUN unzip /tmp/sonar-scanner-cli-${SONAR_SCANNER_VERSION}-linux.zip -d /usr/lib && \
    sed -i 's/use_embedded_jre=true/use_embedded_jre=false/g' /usr/lib/sonar-scanner-${SONAR_SCANNER_VERSION}-linux/bin/sonar-scanner && \
    ln -s /usr/lib/sonar-scanner-${SONAR_SCANNER_VERSION}-linux/bin/sonar-scanner /usr/bin/sonar-scanner

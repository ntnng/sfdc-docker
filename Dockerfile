FROM alpine
LABEL maintainer="Nitin Negi <nitin.negi@gmail.com>"
RUN apk update
RUN apk add bash
RUN apk add openjdk8
RUN apk add apache-ant --update-cache \
	--repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ \
	--allow-untrusted
# Adding git
RUN apk add git
#Drop salesforce migration tool into the ant/lib so it can be used for deployment
COPY lib/ant-salesforce.jar /usr/share/java/apache-ant/lib/
COPY lib/ant-contrib-1.0b3.jar /usr/share/java/apache-ant/lib/
ENV ANT_HOME /usr/share/java/apache-ant
ENV PATH $PATH:$ANT_HOME/bin
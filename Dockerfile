FROM centos/python-27-centos7
MAINTAINER chris060986@github.com

#ADD files/beats-5.6.2.tar.gz /tmp/

RUN curl https://github.com/elastic/beats/archive/v5.6.2.tar.gz \
  | tar -xzf /tmp/beats-5.6.2

WORKDIR /tmp/beats-5.6.2/filebeat/

RUN make python-env

FROM centos/python-27-centos7
MAINTAINER chris060986@github.com

USER root

RUN pip install virtualenv

RUN curl -SL https://github.com/elastic/beats/archive/v5.6.2.tar.gz \
    | tar -xz -C /tmp/

WORKDIR /tmp/beats-5.6.2/filebeat/

RUN make python-env

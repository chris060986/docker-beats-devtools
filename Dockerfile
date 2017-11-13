FROM centos/python-27-centos7
MAINTAINER chris060986@github.com

USER root

RUN yum install -y python-virtualenv

RUN curl -SL https://github.com/elastic/beats/archive/v5.6.2.tar.gz \
    | tar -xz -C /tmp/

WORKDIR /tmp/beats-5.6.2/filebeat/

RUN virtualenv env
RUN . env/bin/activate
RUN pip install -r requirements.txt

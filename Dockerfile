FROM centos:centos7
MAINTAINER chris060986@github.com

USER root

RUN yum clean all && \
        yum -y install epel-release && \
        yum install -y python-pip python-wheel python-virtualenv && \
        pip install --upgrade pip

RUN curl -SL https://github.com/elastic/beats/archive/v5.6.2.tar.gz \
    | tar -xz -C /opt/

WORKDIR /opt/beats-5.6.2/dev-tools/

RUN virtualenv env
RUN . env/bin/activate
RUN pip install -r requirements.txt

WORKDIR /opt/beats-5.6.2/filebeat/

# export
RUN . env/bin/activate
RUN python ../dev-tools/export_dashboards.py --regex Packetbeat*

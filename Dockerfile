FROM centos/python-27-centos7
MAINTAINER chris060986@github.com

USER root

RUN yum update -y && yum install -y python-virtualenv

RUN curl -SL https://github.com/elastic/beats/archive/v5.6.2.tar.gz \
    | tar -xz -C /opt/

WORKDIR /opt/beats-5.6.2/dev-tools/

RUN virtualenv env
RUN . env/bin/activate
RUN python --version
RUN pip install elasticsearch

# export
#RUN . env/bin/activate
#RUN python ../dev-tools/export_dashboards.py --regex Packetbeat*

FROM centos:centos7
MAINTAINER chris060986@github.com

ENV elasticsearch_url http://localhost:9200
ENV regex *
ENV kibana .kibana
ENV dir /var/json/

USER root

RUN yum clean all && \
        yum -y install epel-release && \
        yum install -y openssh python-pip python-wheel python-virtualenv && \
        pip install --upgrade pip

RUN curl -SL https://github.com/elastic/beats/archive/v5.6.2.tar.gz \
    | tar -xz -C /opt/

WORKDIR /opt/beats-5.6.2/dev-tools/

RUN virtualenv env
RUN . env/bin/activate
RUN pip install -r requirements.txt

RUN . env/bin/activate

WORKDIR /opt/beats-5.6.2/filebeat/

# export
RUN python ../dev-tools/export_dashboards.py --regex ${regex} --url ${elasticsearch_url} --kibana ${kibana} --dir ${dir}

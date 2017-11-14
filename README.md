# docker-beats-devtools

This container provides you an easy way to export your custom kibana dashboards, visualizations and searches without setting up the python environment.

## docker image

The image is automatically build by dockerhub and can be found on [here](https://hub.docker.com/r/chris060986/docker-beats-devtools/)

name: chris060986/docker-beats-devtools

__Note__: Only beats-5.6.2 is supported and tested at the moment.

## How to use

Usage is similar to the export dashboard script described in [Exporting Kibana 5.x dashboards](https://www.elastic.co/guide/en/beats/devguide/current/export-dashboards.html#_exporting_kibana_5_x_dashboards), without all the python stuff. But it's possible to specify the same parameters when running the container as if running the plain __export_dashboard.py__ script. If no parameters are specified the script runs with these default-parameters:

    python ../dev-tools/export_dashboards.py --url http://localhost:9200 --regex '.*' --kibana .kibana --dir /var/data


When calling docker run these parameters can be overidden and you can add a volume where to store the dashboards. Therefor, the volume path inside the container and the dir-parameter should be the same. Also make sure, that the container has rights to write into the volume.

    docker run -v localfolder:/var/data chris060986/docker-beats-devtools --url http://localhost:9200 --regex '.*' --kibana .kibana --dir /var/data

__Note__: At the moment it's only possible to overwrite all parameters or use the default parameters provided by this image.
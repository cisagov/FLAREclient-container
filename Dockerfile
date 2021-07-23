FROM docker.artifactory.apps.ecicd.dso.ncps.us-cert.gov/rhmap47/mongodb:latest

ENV MONGODB_ADMIN_PASSWORD=QWASZX23wesdxc

USER root

RUN yum update -y --setopt=tsflags=nodocs \
    --disablerepo=* \      
    --enablerepo=rhel-server-rhscl-7-rpms \
    --enablerepo=rhel-7-server-extras-rpms \
    --enablerepo=rhel-7-server-optional-rpms \
    --enablerepo=rhel-7-server-rpms

USER 184

EXPOSE 27017

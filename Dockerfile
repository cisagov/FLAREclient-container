FROM docker.artifactory.apps.ecicd.dso.ncps.us-cert.gov/rhmap47/mongodb:latest

USER root

RUN yum update -y --setopt=tsflags=nodocs \
    --disablerepo=* \      
    --enablerepo=rhel-server-rhscl-7-rpms \
    --enablerepo=rhel-7-server-extras-rpms \
    --enablerepo=rhel-7-server-optional-rpms \
    --enablerepo=rhel-7-server-rpms \
    sqlite nss-util nss-tools nss-sysinit nss-softokn-freebl nss-softokn nss libicu dbus-libs dbus bind-utils bind-license bind-libs

USER 184

ENV MONGODB_ADMIN_PASSWORD=QWASZX23wesdxc

EXPOSE 27017

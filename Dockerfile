FROM docker.artifactory.apps.ecicd.dso.ncps.us-cert.gov/rhel8/mysql-80:1-86

ENV MYSQL_DATABASE="humanrev"
# USE_DEV_CERTS - when set to true, it is used to
# load certificates for images created locally,
# otherwise no certs / keys will be bundled into the image
ARG USE_DEV_CERTS="false"


USER root

# Add files
COPY docker/my.cnf                                  /etc/my.cnf
COPY mysql/201911081437_user_admin.sql              /schemas/
COPY mysql/201911121005_main_tables.sql             /schemas/
COPY mysql/201911121030_load_lookup_tables.sql      /schemas/
COPY mysql/201912161600_insert_sample_approver.sql  /schemas/
#ADD docker/copy_certs_entrypoint.sh /copy_certs_entrypoint.sh
#COPY docker/certs/ /var/opt/mysql_certs/
ADD docker/51-load-schemas.sh                       /usr/share/container-scripts/mysql/init/51-load-schemas.sh

# Remove dev certs if not running locally
#RUN if [ "${USE_DEV_CERTS}" = "false" ] ; then rm /var/opt/mysql_certs/*; fi

# Adjust file permissions
RUN chmod 754 /copy_certs_entrypoint.sh
RUN chown mysql:mysql /copy_certs_entrypoint.sh
RUN chown -R mysql /var/lib/mysql
#RUN mkdir /var/lib/mysql-files
RUN chown -R mysql:mysql /var/lib/mysql-files

WORKDIR /
ENTRYPOINT [ "./copy_certs_entrypoint.sh" ]
USER mysql
CMD ["run-mysqld"]

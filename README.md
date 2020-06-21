# ![hr_logo](icon.png) Human_Review_Db
This repository contains the schemas necessary to create a database
for Human Review (https://git.ecicd.dso.ncps.us-cert.gov/optimus/Human_Review).


## Docker Operation
In order to run the human review service as a container, navigate to the root
directory of this repository, then execute the following commands:
```bash
./build-docker-image.sh   # if you haven't yet built this image
./run.sh
```

If an instance of the container is already running, you may have to 
run `docker rm -f humanreview-db` first to remove the existing container.

#### MySQL Schemas
The docker container will load schemas in alpha/numeric order by the script 
`docker/51-load-schemas.sh`. This bash file will load schema files from whatever is loaded
with the `Dockerfile` into the container directory `/schemas/`. 


#### Docker Configuration
Configuration of the container is accomplished by passing in different
environmental variables to the container. In order to do this, change the 
values provided with the `-e` flags. **All configurable environment 
variables are listed in `run.sh`**.

For example, if you want to change the mysql user for human review, change the following line:
```bash
-e MYSQL_USER=hr \
```
To:
```bash
-e MYSQL_USER=someOtherUser \
```

#### SSL Configuration

TBD



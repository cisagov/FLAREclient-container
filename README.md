# ![hr_logo](icon.png) FlareClient_mongo
This repository contains the schemas necessary to create a mongo instance
for Flareclient(https://git.ecicd.dso.ncps.us-cert.gov/fire/FLAREclient-Java).


## Docker Operation
**It is recommended to use the AIS-run utility (https://git.ecicd.dso.ncps.us-cert.gov/fireteam/AIS-run) to run the Human Review 
service.**

In order to run the human review service as a container, navigate to the root
directory of this repository, then execute the following commands:
```bash
./build-docker-image.sh   # if you haven't yet built this image
./run.sh
```

If an instance of the container is already running, you may have to 
run `docker rm -f flareclient-mongo` first to remove the existing container.


#### Docker Configuration
Configuration of the container is accomplished by passing in different
environmental variables to the container. In order to do this, change the 
values provided with the `-e` flags. **All configurable environment 
variables are listed in `run.sh`**.


#### SSL Configuration

TBD



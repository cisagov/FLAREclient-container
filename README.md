# ![hr_logo](icon.png) Human_Review_Db
This repository contains the schemas necessary to create a database
for Human Review (https://git.ecicd.dso.ncps.us-cert.gov/optimus/Human_Review).


## Docker Operation
In order to run the human review service as a container, execute the `run.py` script.

#### Configuration
Configuration of the container is accomplished by passing in different
environmental variables to the container. In order to do this, change the 
values provided with the `-e` flags. **All configurable environment 
variables are listed in `run.py`**.

For example, if you want to change the mysql user for human review, change the following line:
```bash
-e MYSQL_USER=hr \
```
To:
```bash
-e MYSQL_USER=someOtherUser \
```
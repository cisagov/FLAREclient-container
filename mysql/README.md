# MYSQL DATABASE

# Overview

This directory contains scripts associated with creating the tables and objects
in MySQL that make up the database for the Human Review application. All scripts
are prefixed with a timestamp that clearly indicates the order in which the
scripts are to be executed.

Note the a MySQL database is only used for development activities, because it's
easy for developers to run a MySQL database locally.

# Some MySQL Notes

  1. There is no real BOOLEAN type. It's a really an alias for TINYINT, so
     booleans are represented in the database as 0 or 1 (technically non-zero).

  2. MySQL supports AUTOINCREMENT columns.

  3. The first script executed also creates the "humanrev" database, if it does
     not already exist.

  4. Timestamps will automatically be set for CREATED_AT and UPDATED_AT
     columns when rows are inserted or updated.

# Running the Scripts

Run MySQL (actually Maria, the open source fork of MySQL which is natively
supported by Red Hat Enterprise Linux):

   $ mysql

You'll probably want to run this command as root. The step in the scripts that
creates the "humanrev" database are usually only allowed to be done by root.

To run a SQL script, within MySQL do:

   > source all.sql

This master script will run all of the SQL scripts in the proper order to
create the initial database and all of its tables, as well as any subsequent
updates to the database structure.

Note that, as changes are added, all of the subsidiary SQL scripts should be
run in order based on the timestamps incorporated into their titles. The
"all.sql" script handles running all of the subsidiary SQL scripts in order
based on timestamp.

The script is reentrant, which means that it can be run multiple times without
causing an error. However, it supports this by essentially dropping all of the
tables, and then recreating everything from scratch. So be aware...

# Troubleshooting

Internally, MySQL is using the InnoDB database engine (an open source
component). If errors occur, the following MySQL command is useful in getting
a more detailed explanation of the error:

  > show engine innodb status;

You'll get lots of useless information, but toward the top of the output will
be details about the most recently encountered error.

  > show errors;

The above command can also be useful, though the details are more sparse than
the previous command.

# Some MYSQL Tips

Within MySQL, here are some useful commands...

Show the tables in the current schema:

   > show tables;

Show the triggers in the current schema:

   > show triggers;

There are triggers on some tables, notably ERROR_MESSAGES, USER_SESSIONS and
USERS. The triggers ensure that:

  1. The CREATED_AT column is set to the current timestamp when a row
     is inserted into a table.

  2. The UPDATED_AT column is set to the current timestamp when a row
     is inserted or updated.
  
To see the definition of a table:

   > desc [table-name];

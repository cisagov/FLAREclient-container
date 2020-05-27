# ORACLE DATABASE

# Overview

This directory contains scripts associated with creating the tables and objects
that make up the database for the Human Review. The first time the database is created, you 
should run the all.sql script, which will run the initial set of scripts.  Any future scripts 
needed should be included in any future migration instructions.

The Oracle database creation scripts are used for test and production
environments.

# Prerequisites

  1. The database should be Oracle 12c, as some features of the SQL scripts
     will not work in previous versions of Oracle.

  2. The database user account (HRADMIN, HR) and role (HR_ROLE) should be created before the SQL scripts are
     executed. Note that the terms "user" and "schema" are synonymous in
     Oracle, so this also represents the schema in which all the tables and
     objects will be created.
    

# Running the Scripts
Change to the directory with the scripts

	cd /<directory>


Run sqlplus, Oracle's command-line interface:

	$ sqlplus [user]@[database]

The script will then prompt you for the password.

To run a SQL script  within sqlplus do:

	> @all.sql


This will run the initial SQL scripts to create the database and all of its
tables and an initial user.

# Troubleshooting

Whenever Oracle encounters an error, it generates a message that looks like:

  ORA-[5-digit number] : [message]

The 5-digit number is easy to look up online. Additionally, many times the
message text is common enough to generate search hits, too. The bottom line is
that there are lots of resources online to help in debugging Oracle errors.

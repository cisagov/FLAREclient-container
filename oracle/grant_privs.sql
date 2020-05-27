-- This script should be run in the HRADMIN user account, which is the one
-- that will own all of the database objects.
--
-- The sstored procedure ensures that the application user (HUMANREV) has all the
-- necessary privileges to run SQL statements on the tables in the schema. It
-- does this by assigning all of the necessary privilges to a role
-- (HUMANREV_ROLE), which has separately been assigned to the HUMANREV user by
-- a DBA.
--
-- Note: Running this script creates the stored procedure. Running the stored
-- procedure is a separate action.

CREATE OR REPLACE PROCEDURE grant_privs
IS
   CURSOR ut_cur IS SELECT table_name FROM user_tables;
   ut_rec ut_cur%ROWTYPE;
BEGIN
   -- Grant privileges for tables
   FOR ut_rec IN ut_cur
   LOOP
      EXECUTE IMMEDIATE 'GRANT SELECT, INSERT, UPDATE, DELETE ON ' || ut_rec.table_name || ' TO HR_ROLE';
   END LOOP;

END;
/

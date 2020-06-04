-- This stored procedure should be created in the hradmin account, which is
-- used by the application to access database objects.
--
-- The stored procedure ensures that the application user has all the necessary
-- synonyms set up so that it can seamlessly access the tables and other
-- database owned by the HRADMIN account.
--
-- Note 1: Will need to modify the script slightly if the owner of the database
-- objects is named something other than "hradmin".
--
-- Note 2: Running this script creates the stored procedure. Running the stored
-- procedure is a separate action.


CREATE OR REPLACE PROCEDURE create_synonyms
AUTHID CURRENT_USER IS
   CURSOR ut_cur IS SELECT table_name FROM all_tables WHERE owner = 'HRADMIN';
   ut_rec ut_cur%ROWTYPE;
BEGIN
   -- Create synonyms for tables
   FOR ut_rec IN ut_cur
   LOOP
      -- DBMS_OUTPUT.PUT_LINE( 'CREATE OR REPLACE SYNONYM ' || 'HR.' || ut_rec.table_name || ' FOR HRADMIN.' || ut_rec.table_name);
      EXECUTE IMMEDIATE 'CREATE OR REPLACE SYNONYM ' || 'HR.' || ut_rec.table_name || ' FOR HRADMIN.' || ut_rec.table_name;
   END LOOP;

END;
/

/

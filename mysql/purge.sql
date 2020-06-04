CREATE DATABASE IF NOT EXISTS humanrev;
USE humanrev;

-- Drops the MAIN Tables in the proper order ---------------------------

DROP TABLE IF EXISTS error_messages;
DROP TABLE IF EXISTS contents;
DROP TABLE IF EXISTS out_queue;
DROP TABLE IF EXISTS human_review_revisions;
DROP TABLE IF EXISTS human_review_fields;
DROP TABLE IF EXISTS human_reviews;
DROP TABLE IF EXISTS jobs;
DROP TABLE IF EXISTS traceability_transfer;
DROP TABLE IF EXISTS status_lookup;

-- Drops the USER ADMIN tables in the proper order ---------------------

DROP TABLE IF EXISTS user_roles;
DROP TABLE IF EXISTS role_privileges;
DROP TABLE IF EXISTS roles;
DROP TABLE IF EXISTS user_sessions;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS privileges;

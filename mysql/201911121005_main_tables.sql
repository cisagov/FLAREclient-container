-- Creates Lookup tables in the proper order ---------------------------

-- Not actually used as a foreign key; just for documentation purposes

CREATE TABLE IF NOT EXISTS status_lookup (
  id               INT UNSIGNED NOT NULL,
  status_code      CHAR(1) NOT NULL,
  name             VARCHAR(255) NOT NULL,
  description      VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
  );

-- Creates the primary tables in the proper order. ---------------------

-- NOTE: The ORIGINATING_JOB_ID is the JOB ID associated with this job
-- in the Orchestrator application.

CREATE TABLE IF NOT EXISTS jobs (
  id                 INT UNSIGNED NOT NULL AUTO_INCREMENT,
  created_at         TIMESTAMP NOT NULL DEFAULT current_timestamp(),
  ended_at           TIMESTAMP NULL,
  instance           VARCHAR(255) NOT NULL,
  originating_job_id INT UNSIGNED,
  priority           VARCHAR(255),
  started_at         TIMESTAMP NULL,
  status             CHAR(1) NOT NULL DEFAULT 'N',
  updated_at         TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  user_id            INT UNSIGNED NOT NULL,
  needs_review         CHAR(1) DEFAULT '1' NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_jobs_users FOREIGN KEY (user_id)
    REFERENCES users (id)
);

CREATE TABLE IF NOT EXISTS traceability_transfer (
  id               INT UNSIGNED NOT NULL,
  last_produced_at TIMESTAMP NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS error_messages (
  id               INT UNSIGNED NOT NULL AUTO_INCREMENT,
  created_at       TIMESTAMP NOT NULL DEFAULT current_timestamp(),
  description      TEXT,
  is_warning       BOOLEAN NOT NULL DEFAULT 0,
  job_id           INT UNSIGNED,
  PRIMARY KEY (id),
  CONSTRAINT fk_errors_job FOREIGN KEY (job_id)
    REFERENCES jobs (id)
);

-- For the CONTENTS table, legal values for CONTENT_EDITION are
-- "ORIGINAL", "REDACTED" and "SANITIZED". Legal values for
-- UPLOADED_FROM are "API", "UPLOAD" and "AMQP". These may
-- eventually be enforced by constraints.

CREATE TABLE IF NOT EXISTS contents (
  id               INT UNSIGNED NOT NULL AUTO_INCREMENT,
  content_edition  VARCHAR(50) NOT NULL,
  created_at       TIMESTAMP NOT NULL DEFAULT current_timestamp(),
  stix_id     	   VARCHAR(255) NOT NULL,
  file_size        INT NOT NULL,
  job_id           INT UNSIGNED NOT NULL,
  mime_type        VARCHAR(255) NOT NULL,
  raw_content      BLOB,
  updated_at       TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  uploaded_from    VARCHAR(30) NOT NULL DEFAULT 'API',
  PRIMARY KEY (id),
  CONSTRAINT fk_contents_job FOREIGN KEY (job_id)
    REFERENCES jobs (id)
);

CREATE TABLE IF NOT EXISTS human_reviews (
  id               INT UNSIGNED NOT NULL AUTO_INCREMENT,
  approved_at      TIMESTAMP NULL,
  approved_by      INT UNSIGNED NULL,
  fields_count     INT NOT NULL DEFAULT 0,
  fields_count_completed INT NOT NULL DEFAULT 0,
  job_id           INT UNSIGNED NOT NULL,
  locked_at        TIMESTAMP NULL,
  locked_by        INT UNSIGNED NULL,
  submitted_at     TIMESTAMP NULL,
  submitted_by     INT UNSIGNED NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_hr_job FOREIGN KEY (job_id)
    REFERENCES jobs (id),
  CONSTRAINT fk_hrappr_user FOREIGN KEY (approved_by)
    REFERENCES users (id),
  CONSTRAINT fk_hrlock_user FOREIGN KEY (locked_by)
    REFERENCES users (id),
  CONSTRAINT fk_hrsubm_user FOREIGN KEY (submitted_by)
    REFERENCES users (id)
);

CREATE TABLE IF NOT EXISTS human_review_fields (
  id                     INT UNSIGNED NOT NULL AUTO_INCREMENT,
  field_name             VARCHAR(50) NOT NULL,
  field_value_original   TEXT,
  has_pii                BOOLEAN NOT NULL,
  human_review_id        INT UNSIGNED NOT NULL,
  is_changed             BOOLEAN NOT NULL DEFAULT 0,
  object_name            VARCHAR(255),
  PRIMARY KEY (id),
  CONSTRAINT fk_hrf_hr FOREIGN KEY (human_review_id)
    REFERENCES human_reviews (id)
);

CREATE TABLE IF NOT EXISTS human_review_revisions (
  id                     INT UNSIGNED NOT NULL AUTO_INCREMENT,
  created_at       		 TIMESTAMP NOT NULL DEFAULT current_timestamp(),
  field_value_revised    TEXT,
  reason				 VARCHAR(255),
  field_id               INT UNSIGNED NOT NULL,
  is_active              BOOLEAN NOT NULL DEFAULT 1,
  user_id                INT UNSIGNED NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_hrr_hr FOREIGN KEY (field_id)
    REFERENCES human_review_fields (id),
  CONSTRAINT fk_hrr_user FOREIGN KEY (user_id)
    REFERENCES users (id)
);

-- For the OUT_QUEUE table, possible values for DESTINATION are
-- "Orchestrator" and "IM Dashboard". Possible valyes for FILE_TYPE
-- are "STIX XML" and "JSON Traceability Metrics".

CREATE TABLE IF NOT EXISTS out_queue (
  id                     INT UNSIGNED NOT NULL AUTO_INCREMENT,
  created_at             TIMESTAMP NOT NULL DEFAULT current_timestamp(),
  destination            VARCHAR(255) NOT NULL,
  file_type              VARCHAR(255) NOT NULL,
  job_id                 INT UNSIGNED NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_outq_job FOREIGN KEY (job_id)
    REFERENCES jobs (id)
);

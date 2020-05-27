-- Creates tables for users, roles, privileges and session -------------

CREATE TABLE IF NOT EXISTS privileges (
  id               INT UNSIGNED NOT NULL AUTO_INCREMENT,
  description      VARCHAR(255),
  name             VARCHAR(255),
  PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS user_sessions (
  id               INT UNSIGNED NOT NULL AUTO_INCREMENT,
  session_id       VARCHAR(255) NOT NULL,
  updated_at       TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  username         VARCHAR(255) NOT NULL,
  PRIMARY KEY (id),
  INDEX (session_id)
);

CREATE TABLE IF NOT EXISTS users (
  id               INT UNSIGNED NOT NULL AUTO_INCREMENT,
  api_key          VARCHAR(255),
  api_key_secret_encrypted BLOB,
  created_at       TIMESTAMP NOT NULL DEFAULT current_timestamp(),
  first_name       VARCHAR(255),
  is_deleted       BOOLEAN NOT NULL DEFAULT 0,
  is_disabled      BOOLEAN NOT NULL DEFAULT 0,
  last_name        VARCHAR(255),
  password_encrypted BLOB,
  updated_at       TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  username         VARCHAR(255) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE INDEX (username),
  UNIQUE INDEX (api_key)
);

CREATE TABLE IF NOT EXISTS roles (
  id               INT UNSIGNED NOT NULL AUTO_INCREMENT,
  created_at       TIMESTAMP NOT NULL DEFAULT current_timestamp(),
  created_by       INT UNSIGNED NOT NULL,
  description      VARCHAR(255),
  name             VARCHAR(255) NOT NULL,
  updated_at       TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  updated_by       INT UNSIGNED NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_roles_created_by FOREIGN KEY (created_by)
    REFERENCES users (id),
  CONSTRAINT fk_roles_updated_by FOREIGN KEY (updated_by)
    REFERENCES users (id)
);

CREATE TABLE IF NOT EXISTS role_privileges (
  created_at       TIMESTAMP NOT NULL DEFAULT current_timestamp(),
  created_by       INT UNSIGNED NOT NULL,
  privilege_id     INT UNSIGNED NOT NULL,
  role_id          INT UNSIGNED NOT NULL,
  PRIMARY KEY (privilege_id, role_id),
  CONSTRAINT fk_rolepriv_priv FOREIGN KEY (privilege_id)
    REFERENCES privileges (id),
  CONSTRAINT fk_rolepriv_role FOREIGN KEY (role_id)
    REFERENCES roles (id)
);

CREATE TABLE IF NOT EXISTS user_roles (
  created_at       TIMESTAMP NOT NULL DEFAULT current_timestamp(),
  created_by       INT UNSIGNED NOT NULL,
  role_id     INT UNSIGNED NOT NULL,
  user_id          INT UNSIGNED NOT NULL,
  PRIMARY KEY (role_id, user_id),
  CONSTRAINT fk_userrole_role FOREIGN KEY (role_id)
    REFERENCES roles (id),
  CONSTRAINT fk_userrole_user FOREIGN KEY (user_id)
    REFERENCES users (id)
);

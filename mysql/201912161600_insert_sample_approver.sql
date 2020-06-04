USE `humanrev`;

INSERT INTO users (username) VALUES ('testuser');

-- Insert Privileges -------------------------------------------
INSERT INTO privileges (id, name, description)
VALUES (1, 'Approver', 'Can approve human reviews');

INSERT INTO privileges (id, name, description)
VALUES (2, 'Admin', 'Can perform administrative functions');

-- Default Roles -----------------------------------------------
INSERT INTO roles (id, name, description, created_by, updated_by)
VALUES (1, 'Approver', 'Manages approvals for Human Reviews', 1, 1);

INSERT INTO roles (id, name, description, created_by, updated_by)
VALUES (2, 'Admin', 'Performs administrative functions', 1, 1);

-- Default Privileges Assigned to the Default Roles ------------

INSERT INTO role_privileges (role_id, privilege_id, created_by)
VALUES (1, 1, 1);

INSERT INTO role_privileges (role_id, privilege_id, created_by)
VALUES (2, 2, 1);

-- Default Roles assiged to the Default User -------------------

INSERT INTO user_roles (user_id, role_id, created_by)
VALUES (1, 1, 1);

INSERT INTO user_roles (user_id, role_id, created_by)
VALUES (1, 2, 1);

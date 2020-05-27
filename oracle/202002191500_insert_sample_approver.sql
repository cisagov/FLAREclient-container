-- Insert Default User for Testing -------------------------------------------
INSERT INTO users (username) VALUES ('testuser');

-- Insert Privileges ---------------------------------------------------------
INSERT INTO privileges (name, description) VALUES ('Admin', 'Can perform administrative functions');

INSERT INTO privileges (name, description) VALUES ('Approver', 'Can approve Human Reviews');

-- Insert Default Roles ------------------------------------------------------
INSERT INTO roles (name, description, created_by, updated_by) VALUES ('Admin', 'Who can perform administrative tasks.', (SELECT id FROM users WHERE username = 'testuser'), (SELECT id FROM users WHERE username = 'testuser'));

INSERT INTO roles (name, description, created_by, updated_by) VALUES ('Approver', 'Who can approve human reviews', (SELECT id FROM users WHERE username = 'testuser'), (SELECT id FROM users WHERE username = 'testuser'));

-- Assign Privileges to the Default Roles ------------------------------------

INSERT INTO role_privileges (role_id, privilege_id, created_by) VALUES ((SELECT id FROM roles WHERE name = 'Approver'), (SELECT id FROM privileges WHERE name = 'Approver'), (SELECT id FROM users WHERE username = 'testuser'));

-- Assign Roles to the Default User ------------------------------------------

INSERT INTO user_roles (user_id, role_id, created_by) VALUES ((SELECT id FROM users WHERE username = 'testuser'), (SELECT id FROM roles WHERE name = 'Approver'), (SELECT id FROM users WHERE username = 'testuser'));

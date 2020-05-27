-- Insert sample admin role_privileges and user_roles for testing --------------------------
INSERT INTO users (username) VALUES ('admin');

INSERT INTO role_privileges (role_id, privilege_id, created_by) VALUES ((SELECT id FROM roles WHERE name = 'Admin'), (SELECT id FROM privileges WHERE name = 'Admin'), (SELECT id FROM users WHERE username = 'admin'));

INSERT INTO user_roles (user_id, role_id, created_by) VALUES ((SELECT id FROM users WHERE username = 'admin'), (SELECT id FROM roles WHERE name = 'Admin'), (SELECT id FROM users WHERE username = 'admin'));

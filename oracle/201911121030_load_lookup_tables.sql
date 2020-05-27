--- Insert Values for the STATUS_LOOKUP table -----------------------------

INSERT INTO status_lookup (id, status_code, name, description)
VALUES (1, 'A', 'Aborted', 'Job Aborted While In Progress');

INSERT INTO status_lookup (id, status_code, name, description)
VALUES (2, 'F', 'Failure', 'Job Failed');

INSERT INTO status_lookup (id, status_code, name, description)
VALUES (3, 'I', 'In Progress', 'Job Is In Progress');

INSERT INTO status_lookup (id, status_code, name, description)
VALUES (4, 'N', 'Not Started', 'Not Yet Started');

INSERT INTO status_lookup (id, status_code, name, description)
VALUES (5, 'S', 'Success', 'Job Completed Successfully');

INSERT INTO status_lookup (id, status_code, name, description)
VALUES (6, 'M', 'Submitted', 'Job submitted Successfully');

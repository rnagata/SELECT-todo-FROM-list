DROP TABLE IF EXISTS tasks;

CREATE TABLE tasks (
  id  serial PRIMARY KEY,
  title varchar(255) NOT NULL,
  description text,
  created_at timestamp without time zone NOT NULL DEFAULT now(),
  updated_at timestamp without time zone,
  completed boolean NOT NULL DEFAULT false
);

ALTER TABLE tasks
  DROP COLUMN IF EXISTS completed;

ALTER TABLE tasks
  ADD COLUMN completed_at timestamp DEFAULT NULL;

ALTER TABLE tasks
  ALTER COLUMN updated_at 
  SET NOT NULL;
ALTER TABLE tasks
  ALTER COLUMN updated_at
  SET DEFAULT now();

INSERT INTO tasks 
  VALUES (DEFAULT, 'Study SQL', 'Complete this exercise', now(), now(), NULL);

INSERT INTO tasks
  VALUES (DEFAULT, 'Study PostgreSQL', 'Read all the documentation');

SELECT title FROM tasks WHERE completed_at IS NOT NULL;
UPDATE tasks
  SET completed_at = now()
  WHERE title = 'Study SQL';

SELECT title, description FROM tasks WHERE completed_at IS NULL;

SELECT * FROM tasks 
  ORDER BY created_at DESC;

INSERT INTO tasks
  VALUES (DEFAULT, 'mistake 1', 'a test entry');

INSERT INTO tasks
  VALUES (DEFAULT, 'mistake 2', 'another test entry');

INSERT INTO tasks
  VALUES (DEFAULT, 'third mistake', 'another test entry');

SELECT title FROM tasks WHERE title LIKE '%mistake%';

DELETE FROM tasks
  WHERE title = 'mistake 1';

SELECT title, description FROM tasks WHERE title LIKE '%mistake%';

DELETE FROM tasks
  WHERE title LIKE '%mistake%';

SELECT * FROM tasks
  ORDER BY title ASC;
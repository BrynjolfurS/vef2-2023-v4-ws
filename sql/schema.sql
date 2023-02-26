CREATE TABLE public.department (
  id SERIAL PRIMARY KEY,
  title VARCHAR(64) NOT NULL UNIQUE,
  slug VARCHAR(64) NOT NULL UNIQUE,
  description TEXT
);

CREATE TYPE semester AS ENUM ('Vor', 'Sumar', 'Haust', 'Heilsárs');

CREATE TABLE public.course (
  id SERIAL PRIMARY KEY,
  course_id VARCHAR(16) NOT NULL UNIQUE,
  department_id INTEGER NOT NULL,
  title VARCHAR(64) NOT NULL UNIQUE,
  slug VARCHAR(64) NOT NULL UNIQUE,
  units REAL NOT NULL CONSTRAINT units_check CHECK (units > 0),
  semester semester NOT NULL,
  level VARCHAR(128) DEFAULT NULL,
  url VARCHAR(256) DEFAULT NULL,
  CONSTRAINT fk_department_id FOREIGN KEY (department_id) REFERENCES department(id)
);

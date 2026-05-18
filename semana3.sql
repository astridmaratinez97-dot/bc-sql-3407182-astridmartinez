-- ============================================
-- ELIMINAR TABLAS SI EXISTEN
-- ============================================

DROP TABLE IF EXISTS competencies;
DROP TABLE IF EXISTS instructors;
DROP TABLE IF EXISTS apprentices;
DROP TABLE IF EXISTS programs;

-- ============================================
-- CREACIÓN DE TABLAS
-- ============================================

-- TABLA PROGRAMS

CREATE TABLE IF NOT EXISTS programs (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    level TEXT NOT NULL DEFAULT 'technician',
    duration_months INTEGER NOT NULL CHECK (duration_months > 0)
);

-- TABLA APPRENTICES

CREATE TABLE IF NOT EXISTS apprentices (
    id INTEGER PRIMARY KEY,
    full_name TEXT NOT NULL,
    age INTEGER NOT NULL CHECK (age >= 16),
    email TEXT NOT NULL UNIQUE,
    is_active INTEGER NOT NULL DEFAULT 1,
    program_id INTEGER NOT NULL,
    FOREIGN KEY (program_id) REFERENCES programs(id)
);

-- TABLA INSTRUCTORS

CREATE TABLE IF NOT EXISTS instructors (
    id INTEGER PRIMARY KEY,
    full_name TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    specialty TEXT NOT NULL
);

-- TABLA COMPETENCIES

CREATE TABLE IF NOT EXISTS competencies (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    description TEXT NOT NULL,
    program_id INTEGER NOT NULL,
    FOREIGN KEY (program_id) REFERENCES programs(id)
);

-- ============================================
-- PARTE 1: INSERT INTO
-- ============================================

-- INSERTAR PROGRAMS

INSERT INTO programs (
    id,
    name,
    level,
    duration_months
)
VALUES
(1, 'Software Analysis', 'technologist', 24),
(2, 'Database Management', 'technician', 18),
(3, 'Web Development', 'technologist', 24),
(4, 'Cybersecurity', 'technologist', 36),
(5, 'Mobile Development', 'technician', 20),
(6, 'Cloud Computing', 'technologist', 30),
(7, 'Artificial Intelligence', 'technologist', 36),
(8, 'Network Administration', 'technician', 24),
(9, 'Software Testing', 'technician', 18),
(10, 'UI UX Design', 'technician', 18),
(11, 'DevOps Engineering', 'technologist', 30),
(12, 'Data Analysis', 'technician', 24),
(13, 'Game Development', 'technician', 20),
(14, 'Digital Marketing', 'technician', 18),
(15, 'IT Support', 'technician', 12);

-- INSERTAR APPRENTICES

INSERT INTO apprentices (
    id,
    full_name,
    age,
    email,
    is_active,
    program_id
)
VALUES
(1, 'Alexander Ospina', 18, 'alex@sena.edu.co', 1, 1),
(2, 'Juan Lopez', 20, 'juan@sena.edu.co', 1, 2),
(3, 'Maria Gomez', 19, 'maria@sena.edu.co', 1, 3),
(4, 'Carlos Perez', 22, 'carlos@sena.edu.co', 1, 4),
(5, 'Laura Ramirez', 21, 'laura@sena.edu.co', 1, 5),
(6, 'Andres Torres', 23, 'andres@sena.edu.co', 1, 6),
(7, 'Camila Rodriguez', 18, 'camila@sena.edu.co', 1, 7),
(8, 'Sofia Martinez', 20, 'sofia@sena.edu.co', 1, 8),
(9, 'Daniel Hernandez', 24, 'daniel@sena.edu.co', 1, 9),
(10, 'Valeria Castro', 19, 'valeria@sena.edu.co', 1, 10),
(11, 'Sebastian Ruiz', 21, 'sebastian@sena.edu.co', 1, 11),
(12, 'Paula Moreno', 22, 'paula@sena.edu.co', 1, 12),
(13, 'Miguel Vargas', 20, 'miguel@sena.edu.co', 1, 13),
(14, 'Isabella Rojas', 18, 'isabella@sena.edu.co', 1, 14),
(15, 'David Fernandez', 25, 'david@sena.edu.co', 1, 15);

-- INSERTAR INSTRUCTORS

INSERT INTO instructors (
    id,
    full_name,
    email,
    specialty
)
VALUES
(1, 'Pedro Ruiz', 'pedro@sena.edu.co', 'SQL'),
(2, 'Laura Martinez', 'laura@sena.edu.co', 'Web Development'),
(3, 'Andres Silva', 'andres.silva@sena.edu.co', 'Cybersecurity'),
(4, 'Sofia Castro', 'sofia.castro@sena.edu.co', 'Cloud Computing'),
(5, 'Jorge Rios', 'jorge.rios@sena.edu.co', 'Artificial Intelligence');

-- INSERTAR COMPETENCIES

INSERT INTO competencies (
    id,
    name,
    description,
    program_id
)
VALUES
(1, 'SQL Basics', 'Introduction to SQL queries and databases', 2),
(2, 'Frontend Development', 'HTML CSS and JavaScript basics', 3),
(3, 'Network Security', 'Security principles for networks', 4),
(4, 'Cloud Services', 'Cloud platforms and deployment', 6),
(5, 'Machine Learning', 'Introduction to artificial intelligence models', 7);

-- ============================================
-- PARTE 2: UPDATE
-- ============================================

-- ACTUALIZAR UNA FILA ESPECÍFICA

UPDATE apprentices
SET age = 19
WHERE id = 1;

-- ACTUALIZAR MÚLTIPLES COLUMNAS

UPDATE programs
SET name = 'Advanced Web Development',
    duration_months = 30
WHERE id = 3;

-- ACTUALIZAR MÚLTIPLES FILAS

UPDATE apprentices
SET is_active = 0
WHERE age >= 24;

-- ============================================
-- PARTE 3: DELETE SEGURO
-- ============================================

-- VERIFICAR QUÉ FILAS SERÁN ELIMINADAS

SELECT
    id,
    full_name,
    age
FROM apprentices
WHERE is_active = 0;

-- ELIMINAR FILAS INACTIVAS

DELETE FROM apprentices
WHERE is_active = 0;

-- ============================================
-- VERIFICACIÓN FINAL
-- ============================================

SELECT
    id,
    name,
    level,
    duration_months
FROM programs
ORDER BY id;

SELECT
    id,
    full_name,
    age,
    email,
    is_active,
    program_id
FROM apprentices
ORDER BY id;

SELECT
    id,
    full_name,
    email,
    specialty
FROM instructors
ORDER BY id;

SELECT
    id,
    name,
    description,
    program_id
FROM competencies
ORDER BY id;
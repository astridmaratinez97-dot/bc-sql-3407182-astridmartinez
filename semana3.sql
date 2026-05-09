DROP TABLE IF EXISTS enrollments;
DROP TABLE IF EXISTS apprentices;
DROP TABLE IF EXISTS programs;

-- ============================================
-- CREACIÓN DE TABLAS
-- ============================================

CREATE TABLE IF NOT EXISTS apprentices (
    id           INTEGER PRIMARY KEY,
    first_name   TEXT    NOT NULL,
    last_name    TEXT    NOT NULL,
    age          INTEGER NOT NULL CHECK(age >= 16),
    email        TEXT    NOT NULL UNIQUE,
    is_active    INTEGER NOT NULL DEFAULT 1
);

CREATE TABLE IF NOT EXISTS programs (
    id                 INTEGER PRIMARY KEY,
    program_name       TEXT    NOT NULL UNIQUE,
    duration_months    INTEGER NOT NULL CHECK(duration_months > 0),
    level              TEXT    NOT NULL,
    is_active          INTEGER NOT NULL DEFAULT 1
);

CREATE TABLE IF NOT EXISTS enrollments (
    id               INTEGER PRIMARY KEY,
    apprentice_id    INTEGER NOT NULL,
    program_id       INTEGER NOT NULL,
    enrollment_date  TEXT    NOT NULL,
    status           TEXT    NOT NULL DEFAULT 'active',

    FOREIGN KEY (apprentice_id) REFERENCES apprentices(id),
    FOREIGN KEY (program_id) REFERENCES programs(id)
);

-- ============================================
-- PARTE 1: INSERT INTO
-- ============================================

-- Insertar aprendices

INSERT INTO apprentices (
    id,
    first_name,
    last_name,
    age,
    email
)
VALUES
(1,  'Julieta', 'Kim',       18, 'julieta@sena.edu.co'),
(2,  'Juan',    'Lopez',     20, 'juan@sena.edu.co'),
(3,  'Maria',   'Gomez',     19, 'maria@sena.edu.co'),
(4,  'Carlos',  'Perez',     22, 'carlos@sena.edu.co'),
(5,  'Laura',   'Ramirez',   21, 'laura@sena.edu.co'),
(6,  'Andres',  'Torres',    23, 'andres@sena.edu.co'),
(7,  'Camila',  'Rodriguez', 18, 'camila@sena.edu.co'),
(8,  'Sofia',   'Martinez',  20, 'sofia@sena.edu.co'),
(9,  'Daniel',  'Hernandez', 24, 'daniel@sena.edu.co'),
(10, 'Valeria', 'Castro',    19, 'valeria@sena.edu.co'),
(11, 'Sebastian','Ruiz',     21, 'sebastian@sena.edu.co'),
(12, 'Paula',   'Moreno',    22, 'paula@sena.edu.co'),
(13, 'Miguel',  'Vargas',    20, 'miguel@sena.edu.co'),
(14, 'Isabella','Rojas',     18, 'isabella@sena.edu.co'),
(15, 'David',   'Fernandez', 25, 'david@sena.edu.co');

-- Insertar programas

INSERT INTO programs (
    id,
    program_name,
    duration_months,
    level
)
VALUES
(1, 'Software Analysis', 24, 'Technologist'),
(2, 'Database Management', 18, 'Technician'),
(3, 'Web Development', 24, 'Technologist'),
(4, 'Cybersecurity', 36, 'Technologist'),
(5, 'Mobile Development', 20, 'Technician');

-- Insertar matrículas respetando FK

INSERT INTO enrollments (
    id,
    apprentice_id,
    program_id,
    enrollment_date,
    status
)
VALUES
(1, 1, 1, '2026-05-01', 'active'),
(2, 2, 2, '2026-05-02', 'active'),
(3, 3, 3, '2026-05-03', 'completed'),
(4, 4, 4, '2026-05-04', 'active'),
(5, 5, 5, '2026-05-05', 'cancelled');

-- ============================================
-- PARTE 2: UPDATE
-- ============================================

-- Actualizar edad del aprendiz con id 1

UPDATE apprentices
SET age = 19
WHERE id = 1;

-- Actualizar múltiples columnas de un programa

UPDATE programs
SET program_name = 'Advanced Web Development',
    duration_months = 30
WHERE id = 3;

-- Actualizar múltiples filas por condición

UPDATE enrollments
SET status = 'inactive'
WHERE status = 'cancelled';

-- ============================================
-- PARTE 3: DELETE SEGURO
-- ============================================

-- Verificar qué matrícula será eliminada

SELECT id, status
FROM enrollments
WHERE id = 5;

-- Eliminar matrícula cancelada

DELETE FROM enrollments
WHERE id = 5;

-- ============================================
-- VERIFICACIÓN FINAL
-- ============================================

SELECT * FROM apprentices
ORDER BY id;

SELECT * FROM programs
ORDER BY id;

SELECT * FROM enrollments
ORDER BY id;
CREATE TABLE IF NOT EXISTS programs (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    level TEXT NOT NULL DEFAULT 'technician',
    duration_months INTEGER NOT NULL CHECK (duration_months > 0)
);

-- ============================================
-- TABLA APPRENTICES
-- ============================================

CREATE TABLE IF NOT EXISTS apprentices (
    id INTEGER PRIMARY KEY,
    full_name TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    is_active INTEGER NOT NULL DEFAULT 1,
    program_id INTEGER,
    FOREIGN KEY (program_id)
        REFERENCES programs(id)
);

-- ============================================
-- TABLA INSTRUCTORS
-- ============================================

CREATE TABLE IF NOT EXISTS instructors (
    id INTEGER PRIMARY KEY,
    full_name TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE
);

-- ============================================
-- TABLA COMPETENCIES
-- ============================================

CREATE TABLE IF NOT EXISTS competencies (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    description TEXT,
    program_id INTEGER NOT NULL,
    FOREIGN KEY (program_id)
        REFERENCES programs(id)
);

-- ============================================
-- INSERTS
-- ============================================

INSERT INTO programs (
    id,
    name,
    level,
    duration_months
)
VALUES
(1,'Software Analysis','technician',24),
(2,'Database Management','technician',18),
(3,'Web Development','technician',24),
(4,'Cybersecurity','technologist',36),
(5,'Mobile Development','technician',20),
(6,'AI Basics','technologist',30),
(7,'Cloud Computing','technologist',30),
(8,'Data Analysis','technician',18),
(9,'Networking','technician',24),
(10,'Programming Logic','technician',12),
(11,'UI/UX Design','technician',18),
(12,'Software Testing','technician',18),
(13,'DevOps Basics','technologist',30),
(14,'Game Development','technician',24),
(15,'IT Support','technician',12);

INSERT INTO apprentices
VALUES
(1,'Juan Perez','juan@example.com',1,1),
(2,'Maria Lopez','maria@example.com',1,2),
(3,'Carlos Diaz','carlos@example.com',1,3),
(4,'Ana Gomez','ana@example.com',1,4),
(5,'Luis Torres','luis@example.com',1,5);

INSERT INTO instructors
VALUES
(1,'Pedro Ruiz','pedro@example.com'),
(2,'Laura Martinez','laura@example.com'),
(3,'Andres Silva','andres@example.com'),
(4,'Sofia Castro','sofia@example.com'),
(5,'Jorge Rios','jorge@example.com');

INSERT INTO competencies
VALUES
(1,'SQL Basics','Basic SQL queries',2),
(2,'HTML & CSS','Frontend basics',3),
(3,'Networking Fundamentals','Network basics',9),
(4,'Programming Logic','Logic for coding',10),
(5,'Cybersecurity Basics','Security fundamentals',4);

-- ============================================
-- SEMANA 09 - JOINS
-- ============================================

PRAGMA foreign_keys = ON;

-- ============================================
-- CONSULTA 1: INNER JOIN principal
-- Programas con sus aprendices
-- ============================================

SELECT
    a.id AS aprendiz_id,
    a.full_name AS aprendiz,
    a.email,
    p.name AS programa,
    p.level
FROM apprentices a
INNER JOIN programs p
    ON a.program_id = p.id;


-- ============================================
-- CONSULTA 2: JOIN con tres tablas
-- Programa + aprendiz + competencia
-- ============================================

SELECT
    a.full_name AS aprendiz,
    p.name AS programa,
    c.name AS competencia,
    c.description
FROM apprentices a

INNER JOIN programs p
    ON a.program_id = p.id

INNER JOIN competencies c
    ON c.program_id = p.id;


-- ============================================
-- CONSULTA 3: LEFT JOIN
-- Todos los programas incluso sin aprendices
-- ============================================

SELECT
    p.name AS programa,
    a.full_name AS aprendiz
FROM programs p

LEFT JOIN apprentices a
    ON a.program_id = p.id

ORDER BY p.name;


-- ============================================
-- CONSULTA 4: Huérfanos
-- Programas sin aprendices
-- ============================================

SELECT
    p.id,
    p.name AS programa_sin_aprendices

FROM programs p

LEFT JOIN apprentices a
    ON a.program_id = p.id

WHERE a.id IS NULL;


-- ============================================
-- CONSULTA 5: Reporte agregado
-- Cantidad de aprendices por programa
-- ============================================

SELECT

    p.name AS programa,

    COUNT(a.id) AS total_aprendices

FROM programs p

LEFT JOIN apprentices a
    ON a.program_id = p.id

GROUP BY p.id, p.name

ORDER BY total_aprendices DESC;
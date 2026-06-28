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
-- PROYECTO SEMANAL: Operadores y Filtros
-- Semana 05 — BETWEEN, IN, LIKE
-- ============================================

-- ============================================
-- CONSULTA 1: BETWEEN
-- ============================================

SELECT
    id,
    name,
    level,
    duration_months
FROM programs
WHERE duration_months BETWEEN 18 AND 30;


-- ============================================
-- CONSULTA 2: IN
-- ============================================

SELECT
    id,
    full_name,
    email,
    program_id
FROM apprentices
WHERE program_id IN (1, 3, 5);


-- ============================================
-- CONSULTA 3: LIKE
-- ============================================

SELECT
    id,
    full_name,
    email
FROM apprentices
WHERE full_name LIKE '%a%';


-- ============================================
-- CONSULTA 4: Filtro combinado
-- ============================================

SELECT
    id,
    name,
    level,
    duration_months
FROM programs
WHERE duration_months BETWEEN 18 AND 30
AND level IN ('technician', 'technologist')
AND name LIKE '%o%'
ORDER BY duration_months ASC;
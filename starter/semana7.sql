-- ============================================
-- SEMANA 07 - NULL Y CONSTRAINTS
-- ============================================

PRAGMA foreign_keys = ON;

-- ============================================
-- TABLA PROGRAMS
-- ============================================

CREATE TABLE IF NOT EXISTS programs (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL UNIQUE,
    level TEXT NOT NULL DEFAULT 'technician'
        CHECK(level IN ('technician','technologist')),
    duration_months INTEGER NOT NULL
        CHECK(duration_months > 0)
);

-- ============================================
-- TABLA APPRENTICES
-- ============================================

CREATE TABLE IF NOT EXISTS apprentices (
    id INTEGER PRIMARY KEY,

    full_name TEXT NOT NULL,

    email TEXT UNIQUE,

    phone TEXT,

    is_active INTEGER NOT NULL DEFAULT 1
        CHECK(is_active IN (0,1)),

    program_id INTEGER NOT NULL,

    FOREIGN KEY (program_id)
        REFERENCES programs(id)
        ON DELETE RESTRICT
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

    FOREIGN KEY(program_id)
        REFERENCES programs(id)
        ON DELETE RESTRICT
);

-- ============================================
-- INSERTS PROGRAMS
-- ============================================

INSERT INTO programs VALUES
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

-- ============================================
-- INSERTS APPRENTICES
-- ============================================

INSERT INTO apprentices VALUES
(1,'Juan Perez','juan@example.com',NULL,1,1),
(2,'Maria Lopez','maria@example.com','3001234567',1,2),
(3,'Carlos Diaz','carlos@example.com',NULL,1,3),
(4,'Ana Gomez','ana@example.com','3109876543',1,4),
(5,'Luis Torres','luis@example.com',NULL,1,5);

-- ============================================
-- INSERTS INSTRUCTORS
-- ============================================

INSERT INTO instructors VALUES
(1,'Pedro Ruiz','pedro@example.com'),
(2,'Laura Martinez','laura@example.com'),
(3,'Andres Silva','andres@example.com'),
(4,'Sofia Castro','sofia@example.com'),
(5,'Jorge Rios','jorge@example.com');

-- ============================================
-- INSERTS COMPETENCIES
-- ============================================

INSERT INTO competencies VALUES
(1,'SQL Basics','Basic SQL queries',2),
(2,'HTML & CSS','Frontend basics',3),
(3,'Networking Fundamentals','Network basics',9),
(4,'Programming Logic','Logic for coding',10),
(5,'Cybersecurity Basics','Security fundamentals',4);

-- ============================================
-- CONSULTA IS NULL
-- ============================================

SELECT
    id,
    full_name,
    phone
FROM apprentices
WHERE phone IS NULL;

-- ============================================
-- CONSULTA IS NOT NULL
-- ============================================

SELECT
    id,
    full_name,
    phone
FROM apprentices
WHERE phone IS NOT NULL;

-- ============================================
-- CONSULTA COALESCE
-- ============================================

SELECT
    full_name,

    COALESCE(phone,'Sin teléfono registrado')
        AS telefono

FROM apprentices;

-- ============================================
-- CONSULTA IFNULL
-- ============================================

SELECT
    full_name,

    IFNULL(phone,'No disponible')
        AS telefono

FROM apprentices;

-- ============================================
-- CONSULTA NULLIF
-- ============================================

SELECT

    full_name,

    NULLIF(phone,'')

FROM apprentices;
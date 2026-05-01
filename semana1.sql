-- ============================================
-- PASO 1: Crear tablas
-- ============================================

CREATE TABLE programs (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    duration INTEGER
);

CREATE TABLE apprentices (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    age INTEGER,
    program_id INTEGER,
    FOREIGN KEY (program_id) REFERENCES programs(id)
);

-- ============================================
-- PASO 2: Insertar datos
-- ============================================

-- PROGRAMS (5 registros)
INSERT INTO programs (id, name, duration) VALUES
(1, 'ADSO', 24),
(2, 'Diseño Grafico', 18),
(3, 'Contabilidad', 20),
(4, 'Marketing', 16),
(5, 'Electricidad', 22);

-- APPRENTICES (15 registros)
INSERT INTO apprentices (id, name, age, program_id) VALUES
(1, 'Astrid', 18, 1),
(2, 'Juan', 20, 1),
(3, 'Maria', 19, 2),
(4, 'Johan', 22, 3),
(5, 'Ana', 18, 2),
(6, 'Luis', 21, 4),
(7, 'Alex', 20, 5),
(8, 'Pedro', 19, 1),
(9, 'Laura', 23, 3),
(10, 'Miguel', 18, 4),
(11, 'Camila', 20, 2),
(12, 'Andres', 22, 5),
(13, 'Julieth', 19, 1),
(14, 'Diego', 21, 3),
(15, 'Jhonny', 18, 4);

-- ============================================
-- PASO 3: Consultas SELECT
-- ============================================

-- Mostrar todos los aprendices
SELECT id, name, age
FROM apprentices;

-- Mostrar nombres ordenados alfabéticamente
SELECT name
FROM apprentices
ORDER BY name ASC;

-- Contar total de aprendices
SELECT COUNT(*) AS total_apprentices
FROM apprentices;
📄 Semana 02 — DDL: Definición de Datos

Proyecto de la Semana 02 del bootcamp SQL usando SQLite.

📚 Descripción

En esta semana se diseñó el esquema relacional del dominio académico del SENA.

Se crearon las tablas principales:

apprentices
programs
instructors
competencies

Además se aplicaron restricciones para mantener la integridad de los datos.

⚙️ Operaciones realizadas
CREATE TABLE
PRIMARY KEY
FOREIGN KEY
NOT NULL
UNIQUE
CHECK
DEFAULT

🧠 Buenas prácticas aplicadas
Diseño normalizado.
Uso de claves primarias.
Integridad referencial.
Restricciones de negocio.

⚙️ Tecnologías utilizadas
SQLite
SQL
Git
GitHub

▶️ Ejecución
sqlite3 SENA.db < semana2.sql

📌 Nota

Esta semana estuvo enfocada en la creación de estructuras de datos mediante DDL.

📄 Semana 03 — DML: Manipulación de Datos

Proyecto de la Semana 03 del bootcamp SQL usando SQLite.

📚 Descripción

Este proyecto implementa operaciones de manipulación de datos (DML) sobre un sistema académico del SENA.

El dominio del proyecto está compuesto por las siguientes tablas:

apprentices
programs
instructors
competencies

El objetivo fue practicar la inserción, actualización y eliminación de datos de forma segura, respetando las relaciones entre tablas y las restricciones del modelo relacional.

⚙️ Operaciones realizadas

En este proyecto se aplicaron las siguientes operaciones SQL:

INSERT INTO → inserción de datos reales en las tablas del dominio
UPDATE → modificación controlada de registros usando condiciones WHERE
DELETE → eliminación segura de registros con verificación previa
Uso de FOREIGN KEY para mantener la integridad entre tablas
Aplicación de restricciones (NOT NULL, UNIQUE, CHECK, DEFAULT)
🧠 Buenas prácticas aplicadas
Uso obligatorio de WHERE en UPDATE y DELETE para evitar modificaciones masivas
Datos realistas acordes al contexto académico del SENA
Respeto del orden de inserción (tabla padre → tabla hija)
Verificación previa antes de eliminar registros
Estructura limpia y organizada del código SQL
⚙️ Tecnologías utilizadas
SQLite
SQL
Git
GitHub
▶️ Ejecución del proyecto

Para ejecutar el archivo en SQLite:

sqlite3 SENA.db < semana3.sql
📌 Nota

Este proyecto hace parte del proceso de formación del bootcamp, enfocado en la manipulación segura de datos dentro de bases de datos relacionales y el uso correcto de operaciones DML.
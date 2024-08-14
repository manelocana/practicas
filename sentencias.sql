-- crear base de datos

CREATE DATABASE codigofacilito;


-- crear tabla

CREATE TABLE users(
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    age INT UNSIGNED NOT NULL,
    status ENUM('active', 'inactive') DEFAULT 'inactive',
    bio TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- introducir nuevos valores

INSERT INTO users (username, email, age) VALUES ('user1', 'user1@hotmail.com', 17);

INSERT INTO users (username, email, age) VALUES ('user2', 'user2@hotmail.com', 34);
INSERT INTO users (username, email, age) VALUES ('user3', 'user3@hotmail.com', 35);
INSERT INTO users (username, email, age) VALUES ('user4', 'user4@hotmail.com', 66);
INSERT INTO users (username, email, age) VALUES ('user5', 'user5@hotmail.com', 24);
INSERT INTO users (username, email, age) VALUES ('user6', 'user6@hotmail.com', 53);
INSERT INTO users (username, email, age) VALUES ('user7', 'user7@hotmail.com', 32);


-- para ver todas las columnas

SELECT * FROM users;
SELECT * FROM users\G;  -- para verlo en formato cartas


-- actualizar columnas, ¡¡¡ATENCION!!! SI NO PONEMOS CONDICION (WHERE) SE ACTULIZA TODA LA  TABLA

UPDATE users SET bio='esta es la actualizacion de la bio mediante SET', age='15' WHERE id=1;





-- EJERCICIOS:

-- Obtener el usuario con el id numero 2:
SELECT * FROM users WHERE id=2;

-- Obtener el usuario con el email user3@... 
SELECT * FROM users WHERE email='user3@hotmail.com';

-- Obtener todos los usuarios con una edad mayor a 25
SELECT * FROM users WHERE age>25;

-- Obtener todos los usuarios con una edad menor a 50
SELECT * FROM users WHERE age<50;

-- Obtener todos los usuarios que posean una biografia
SELECT * FROM users WHERE bio IS NOT NULL;

-- Obtener todos los usuarios cual fecha de creacion fue el dia de hoy
SELECT * FROM users WHERE created_at > '2024-08-11 00:00:01';
SELECT * FROM users WHERE DATE(created_at) = '2024-08-11';

-- Obtener el username de todos  los usuarios cuyos id se encuentren en el siguiente listado [1,2,3,4]
SELECT * FROM users WHERE id=1 OR id=2 OR id=3 OR id=4;
SELECT * FROM users WHERE id IN (1,2,3,4);

-- Obtener las edades de todos los usuarios mayores de edad
SELECT age FROM users WHERE age > 18;

-- Obtener el username y correo electronico del usuario con mayor edad
SELECT * FROM users ORDER BY age DESC;  -- ordenamos en orden descendente (al reves), por default ordena ascendente
SELECT * FROM users ORDER BY age DESC LIMIT 1;

-- Obtener el username, edad y correo electronico del usuario con menor edad
SELECT username, age, email FROM users ORDER BY age LIMIT 1;

-- Obtener el username, correo y edad de todos los usuarios con rangos de edad entre 30y40
SELECT username, email, age FROM users WHERE age>30 AND age<40;

-- Obtener los usuarios cuyo correo termine en .com  (usamos el %)
SELECT * FROM users WHERE email LIKE '%.com';

-- Obtener los usuarios cuyo correo comience con user...
SELECT * FROM users WHERE email LIKE 'user%';

-- Obtener los usuarios con los caracteres que buscamos por ejemplo 1@
SELECT * FROM users WHERE email LIKE '%1@%';
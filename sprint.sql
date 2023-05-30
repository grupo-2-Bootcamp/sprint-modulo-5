-- SPRINT MODULO 5
-- FRANCO FUENTES SOTO
-- BASTIAN PEREZ GONZALES
-- EDUARDO ESCAREZ GOMEZ


-- Crea el schema y lo utiliza
CREATE SCHEMA telovento_pedidos;
USE telovento_pedidos;


-- Crea tabla usuario
CREATE TABLE usuario (
    id_usuario INT UNSIGNED NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(20) NOT NULL,
    apellido VARCHAR(20) NOT NULL,
    edad INT NOT NULL,
    correo_electronico VARCHAR(45) NOT NULL,
    cantidad_usos INT NOT NULL DEFAULT 1,
    PRIMARY KEY (id_usuario),
    UNIQUE INDEX correo_electronico_UNIQUE (correo_electronico ASC) VISIBLE,
    UNIQUE INDEX id_usuario_UNIQUE (id_usuario ASC) VISIBLE);


-- Crea tabla operario
CREATE TABLE operario (
    id_operario INT UNSIGNED NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(45) NOT NULL,
    apellido VARCHAR(45) NOT NULL,
    edad INT NOT NULL,
    correo_electronico VARCHAR(45) NOT NULL,
    veces_soporte INT NOT NULL DEFAULT 1,
    PRIMARY KEY (id_operario),
    UNIQUE INDEX id_operario_UNIQUE (id_operario ASC) VISIBLE,
    UNIQUE INDEX correo_electronico_UNIQUE (correo_electronico ASC) VISIBLE);


-- Crea tabla soporte
CREATE TABLE soporte (
    id_soporte INT NOT NULL AUTO_INCREMENT,
    id_usuario INT UNSIGNED NOT NULL,
    id_operario INT UNSIGNED NOT NULL,
    fecha DATE NOT NULL,
    evaluacion TINYINT(1) NOT NULL,
    comentario TINYTEXT NULL,
    PRIMARY KEY (id_soporte),
    INDEX fk_soporte_usuario_idx (id_usuario ASC) VISIBLE,
    INDEX fk_soporte_operario1_idx (id_operario ASC) VISIBLE,
    CONSTRAINT fk_soporte_usuario
        FOREIGN KEY (id_usuario)
        REFERENCES usuario (id_usuario)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION,
    CONSTRAINT fk_soporte_operario1
        FOREIGN KEY (id_operario)
        REFERENCES operario (id_operario)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION);


-- Crea usuario y le asigna permisos para acceder a la base de datos
CREATE USER 'sprintBoss'@'localhost' IDENTIFIED BY 'awake*2023';
GRANT ALL PRIVILEGES ON telovento_pedidos.* TO 'sprintBoss'@'localhost';
FLUSH PRIVILEGES;


-- Carga de datos a la tabla USUARIO
INSERT INTO usuario (nombre, apellido, edad, correo_electronico, cantidad_usos)
VALUES
        ('Ximena', 'Rossa', 32, 'xrossa@gmail.com', 1),
        ('Italo', 'Soto', 25, 'isoto@gmail.com', 2),
        ('Marcelo', 'Tapia', 50, 'mtapia@gmail.com', 5),
        ('Francisca', 'Aravena', 35, 'faravena@hotmail.com', 1),
        ('Juan', 'Perez', 40, 'jperez@example.com', 1);


-- Carga de datos a la tabla OPERARIO
INSERT INTO operario (nombre, apellido, edad, correo_electronico, veces_soporte)
VALUES
        ('Juan', 'Pérez', 30, 'juan@example.com', 3),
        ('María', 'Gómez', 25, 'maria@example.com', 5),
        ('Carlos', 'López', 35, 'carlos@example.com', 10),
        ('Ana', 'Sánchez', 18, 'ana@example.com', 2),
        ('Luis', 'Hernández', 19, 'luis@example.com', 7);


-- Carga de datos a la tabla SOPORTE
INSERT INTO soporte (id_usuario, id_operario, fecha, evaluacion, comentario)
VALUES
        (1, 2, '2023-05-22', 5, 'Buen servicio, resolvieron mi problema rápidamente.'),
        (3, 4, '2023-05-23', 7, 'Excelente atención, muy satisfecho con el soporte recibido.'),
        (2, 1, '2023-05-24', 6, 'El operario fue amable y eficiente en la resolución del inconveniente.'),
        (5, 3, '2023-05-25', 4, 'Hubo un retraso en la respuesta, pero finalmente solucionaron el problema.'),
        (4, 5, '2023-05-26', 3, 'No quedé conforme con la atención recibida, falta de seguimiento.'),
        (1, 3, '2023-05-27', 7, 'El soporte fue rápido y eficaz, solucionaron el inconveniente.'),
        (2, 4, '2023-05-28', 6, 'Buen trato por parte del operario, resolvió mi consulta.'),
        (3, 5, '2023-05-29', 2, 'No estoy satisfecho con el servicio, la solución no fue la esperada.'),
        (4, 1, '2023-05-30', 5, 'El soporte fue aceptable, aunque la respuesta demoró un poco.'),
        (5, 2, '2023-05-31', 4, 'El operario fue amable, pero no lograron solucionar mi problema por completo.');


-- Seleccione las 3 operaciones con mejor evaluacion.
SELECT * FROM soporte ORDER BY evaluacion DESC LIMIT 3;


-- Seleccione las 3 operaciones con menos evaluacion.
SELECT * FROM soporte ORDER BY evaluacion ASC LIMIT 3;


-- Seleccione al operario que mas soportes ha realizado.
SELECT * FROM operario ORDER BY veces_soporte DESC LIMIT 1;

-- Seleccione al cliente que menos veces ha utilizado la aplicacion.
SELECT * FROM usuario ORDER BY cantidad_usos ASC LIMIT 1;


-- Agregue 10 años a los tres primeros usuarios registrados.
UPDATE usuario SET edad = edad + 10 WHERE id_usuario < 4;


-- Renombre todas las columnas correo electronico. El nuevo nombre debe ser email.
ALTER TABLE usuario CHANGE correo_electronico email VARCHAR(45);
ALTER TABLE operario CHANGE correo_electronico email VARCHAR(45);


-- Seleccione solo los operarios mayores de 20 años.
SELECT * FROM operario WHERE edad > 20;
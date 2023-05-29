-- SPRINT MODULO 5
-- FRANCO FUENTES SOTO
-- BASTIAN PEREZ GONZALES
-- EDUARDO ESCAREZ GOMEZ


-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`usuario` (
  `id_usuario` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(20) NOT NULL,
  `apellido` VARCHAR(20) NOT NULL,
  `edad` INT NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `cantidad_usos` INT NOT NULL DEFAULT 1,
  PRIMARY KEY (`id_usuario`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  UNIQUE INDEX `id_usuario_UNIQUE` (`id_usuario` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`operario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`operario` (
  `id_operario` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `edad` INT NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `veces_soporte` INT NOT NULL DEFAULT 1,
  PRIMARY KEY (`id_operario`),
  UNIQUE INDEX `id_operario_UNIQUE` (`id_operario` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`soporte`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`soporte` (
  `id_soporte` INT NOT NULL AUTO_INCREMENT,
  `id_usuario` INT UNSIGNED NOT NULL,
  `id_operario` INT UNSIGNED NOT NULL,
  `fecha` DATE NOT NULL,
  `evaluacion` TINYINT(1) NOT NULL,
  `comentario` TINYTEXT NULL,
  PRIMARY KEY (`id_soporte`),
  INDEX `fk_soporte_usuario_idx` (`id_usuario` ASC) VISIBLE,
  INDEX `fk_soporte_operario1_idx` (`id_operario` ASC) VISIBLE,
  CONSTRAINT `fk_soporte_usuario`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `mydb`.`usuario` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_soporte_operario1`
    FOREIGN KEY (`id_operario`)
    REFERENCES `mydb`.`operario` (`id_operario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


CREATE USER 'sprintBoss'@'localhost' IDENTIFIED BY 'awake*2023';
GRANT ALL PRIVILEGES ON mydb.* TO 'sprintBoss'@'localhost';
FLUSH PRIVILEGES;

-- Se seleciona por defecto la base de datos a trabajar
USE mydb;


-- Carga de datos a la tabla USUARIOS
INSERT INTO usuario (nombre, apellido, edad, email, cantidad_usos)
VALUES ('Ximena', 'Rossa', 32, 'xrossa@gmail.com', 1),
       ('Italo', 'Soto', 25, 'isoto@gmail.com', 2),
       ('Marcelo', 'Tapia', 50, 'mtapia@gmail.com', 5),
       ('Francisca', 'Aravena', 35, 'faravena@hotmail.com', 1),
       ('Juan', 'Perez', 40, 'jperez@example.com', 1);

-- Carga de datos a la tabla OPERARIOS
INSERT INTO operario (nombre, apellido, edad, email, veces_soporte)
VALUES ('Juan', 'Pérez', 30, 'juan@example.com', 3),
        ('María', 'Gómez', 25, 'maria@example.com', 5)
        ('Carlos', 'López', 35, 'carlos@example.com', 10)
        ('Ana', 'Sánchez', 28, 'ana@example.com', 2)
        ('Luis', 'Hernández', 32, 'luis@example.com', 7);


-- Carga de datos a la tabla soporte
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





-- Seleccione las 3 operaciones con menos evaluacion.




-- Seleccione al operario que mas soportes ha realizado.





-- Seleccione al cliente que menos veces ha utilizado la aplicacion.




-- Agregue 10 anos a los tres primeros usuarios registrados.




-- Renombre todas las columnas correo electronico. El nuevo nombre debe ser email.




-- Seleccione solo los operarios mayores de 20 anos.




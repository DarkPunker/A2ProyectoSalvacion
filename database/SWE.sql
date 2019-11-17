-- MySQL Script generated by MySQL Workbench
-- Fri Nov 15 02:17:15 2019
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema SoftwareEducativo
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema SoftwareEducativo
-- -----------------------------------------------------
DROP DATABASE IF EXISTS `SoftwareEducativo`;
CREATE SCHEMA IF NOT EXISTS `SoftwareEducativo` DEFAULT CHARACTER SET utf8 ;
USE `SoftwareEducativo` ;

-- -----------------------------------------------------
-- Table `SoftwareEducativo`.`Identificacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SoftwareEducativo`.`Identificacion` (
  `idIdentificacion` INT NOT NULL AUTO_INCREMENT,
  `Tipo` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`idIdentificacion`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SoftwareEducativo`.`Persona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SoftwareEducativo`.`Persona` (
  `idPersona` VARCHAR(45) NOT NULL,
  `Identificacion_idIdentificacion` INT DEFAULT 1,
  `Nombre1` VARCHAR(45) NOT NULL,
  `Nombre2` VARCHAR(45) NULL,
  `Apellido1` VARCHAR(45) NOT NULL,
  `Apellido2` VARCHAR(45) NULL,
  `FechaNacimiento` DATE NOT NULL,
  `Sexo` TINYINT NOT NULL,
  `Direccion_idBarrio` VARCHAR(255) NULL,
  PRIMARY KEY (`idPersona`),
  INDEX `fk_Persona_Identificacion1_idx` (`Identificacion_idIdentificacion` ASC) VISIBLE,
  CONSTRAINT `fk_Persona_Identificacion1`
    FOREIGN KEY (`Identificacion_idIdentificacion`)
    REFERENCES `SoftwareEducativo`.`Identificacion` (`idIdentificacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SoftwareEducativo`.`Telefono`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SoftwareEducativo`.`Telefono` (
  `NumeroTelefono` VARCHAR(10) NOT NULL,
  `Persona_idPersona` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`NumeroTelefono`, `Persona_idPersona`),
  INDEX `fk_Telefono_Persona1_idx` (`Persona_idPersona` ASC) VISIBLE,
  CONSTRAINT `fk_Telefono_Persona1`
    FOREIGN KEY (`Persona_idPersona`)
    REFERENCES `SoftwareEducativo`.`Persona` (`idPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SoftwareEducativo`.`Rol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SoftwareEducativo`.`Rol` (
  `idRol` INT NOT NULL AUTO_INCREMENT,
  `NombreRol` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idRol`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SoftwareEducativo`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SoftwareEducativo`.`Usuario` (
  `idUsuario` VARCHAR(45) NOT NULL,
  `Rol_idRol` INT DEFAULT 1,
  `Persona_cedula` VARCHAR(45) NOT NULL,
  `EstadoRol` TINYINT DEFAULT 1,
  `Correo` VARCHAR(45) NOT NULL,
  `Contrasena` VARCHAR(255) NOT NULL,
  INDEX `fk_Tripulante_Rol1_idx` (`Rol_idRol` ASC) VISIBLE,
  INDEX `fk_Tripulante_Persona1_idx` (`Persona_cedula` ASC) VISIBLE,
  UNIQUE INDEX `Correo_UNIQUE` (`Correo` ASC) VISIBLE,
  PRIMARY KEY (`idUsuario`),
  CONSTRAINT `fk_Tripulante_Rol1`
    FOREIGN KEY (`Rol_idRol`)
    REFERENCES `SoftwareEducativo`.`Rol` (`idRol`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tripulante_Persona1`
    FOREIGN KEY (`Persona_cedula`)
    REFERENCES `SoftwareEducativo`.`Persona` (`idPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SoftwareEducativo`.`Carrera`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SoftwareEducativo`.`Carrera` (
  `idCarrera` INT NOT NULL AUTO_INCREMENT,
  `NombreCurso` VARCHAR(60) NOT NULL,
  `DescripcionCurso` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`idCarrera`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SoftwareEducativo`.`Modulo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SoftwareEducativo`.`Modulo` (
  `idModulo` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idModulo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SoftwareEducativo`.`Unidad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SoftwareEducativo`.`Unidad` (
  `idUnidad` INT NOT NULL AUTO_INCREMENT,
  `NombreUnidad` VARCHAR(45) NOT NULL,
  `Modulo_idModulo` INT NOT NULL,
  PRIMARY KEY (`idUnidad`),
  INDEX `fk_Unidad_Modulo1_idx` (`Modulo_idModulo` ASC) VISIBLE,
  CONSTRAINT `fk_Unidad_Modulo1`
    FOREIGN KEY (`Modulo_idModulo`)
    REFERENCES `SoftwareEducativo`.`Modulo` (`idModulo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SoftwareEducativo`.`Curso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SoftwareEducativo`.`Curso` (
  `idCurso` INT NOT NULL AUTO_INCREMENT,
  `NombreSubCurso` VARCHAR(60) NOT NULL,
  `FechaInicio` DATE NULL,
  `FechaFin` DATE NULL,
  `Curso_idCurso` INT NOT NULL,
  PRIMARY KEY (`idCurso`),
  INDEX `fk_Subcurso_Curso1_idx` (`Curso_idCurso` ASC) VISIBLE,
  CONSTRAINT `fk_Subcurso_Curso1`
    FOREIGN KEY (`Curso_idCurso`)
    REFERENCES `SoftwareEducativo`.`Carrera` (`idCarrera`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SoftwareEducativo`.`Tema`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SoftwareEducativo`.`Tema` (
  `idTema` INT NOT NULL AUTO_INCREMENT,
  `NombreTema` VARCHAR(60) NOT NULL,
  `Unidad_idUnidad` INT NOT NULL,
  PRIMARY KEY (`idTema`),
  INDEX `fk_Tema_Unidad1_idx` (`Unidad_idUnidad` ASC) VISIBLE,
  CONSTRAINT `fk_Tema_Unidad1`
    FOREIGN KEY (`Unidad_idUnidad`)
    REFERENCES `SoftwareEducativo`.`Unidad` (`idUnidad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SoftwareEducativo`.`TipoMultimedia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SoftwareEducativo`.`TipoMultimedia` (
  `idTipoMultimedia` INT NOT NULL AUTO_INCREMENT,
  `TipoMultimedia` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTipoMultimedia`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SoftwareEducativo`.`Multimedia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SoftwareEducativo`.`Multimedia` (
  `idMultimedia` INT NOT NULL AUTO_INCREMENT,
  `NombreMultimedia` VARCHAR(60) NOT NULL,
  `DireccionMultimedia` VARCHAR(255) NOT NULL,
  `EstadoMultimedia` TINYINT NOT NULL,
  `Tema_idTema` INT NOT NULL,
  `TipoMultimedia_idTipoMultimedia` INT NOT NULL,
  PRIMARY KEY (`idMultimedia`),
  INDEX `fk_Video_Tema1_idx` (`Tema_idTema` ASC) VISIBLE,
  INDEX `fk_Multimedia_TipoMultimedia1_idx` (`TipoMultimedia_idTipoMultimedia` ASC) VISIBLE,
  CONSTRAINT `fk_Video_Tema1`
    FOREIGN KEY (`Tema_idTema`)
    REFERENCES `SoftwareEducativo`.`Tema` (`idTema`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Multimedia_TipoMultimedia1`
    FOREIGN KEY (`TipoMultimedia_idTipoMultimedia`)
    REFERENCES `SoftwareEducativo`.`TipoMultimedia` (`idTipoMultimedia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SoftwareEducativo`.`TipoExamen`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SoftwareEducativo`.`TipoExamen` (
  `idTipoExamen` INT NOT NULL AUTO_INCREMENT,
  `NombreTipoExamen` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`idTipoExamen`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SoftwareEducativo`.`Examen`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SoftwareEducativo`.`Examen` (
  `idExamen` INT NOT NULL AUTO_INCREMENT,
  `NombreExamen` VARCHAR(60) NOT NULL,
  `TipoExamen_idTipoExamen` INT NOT NULL,
  PRIMARY KEY (`idExamen`),
  INDEX `fk_Examen_TipoExamen1_idx` (`TipoExamen_idTipoExamen` ASC) VISIBLE,
  CONSTRAINT `fk_Examen_TipoExamen1`
    FOREIGN KEY (`TipoExamen_idTipoExamen`)
    REFERENCES `SoftwareEducativo`.`TipoExamen` (`idTipoExamen`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SoftwareEducativo`.`Pregunta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SoftwareEducativo`.`Pregunta` (
  `idPregunta` INT NOT NULL AUTO_INCREMENT,
  `Pregunta` VARCHAR(255) NOT NULL,
  `Tema_idTema` INT NOT NULL,
  PRIMARY KEY (`idPregunta`),
  INDEX `fk_Pregunta_Tema1_idx` (`Tema_idTema` ASC) VISIBLE,
  CONSTRAINT `fk_Pregunta_Tema1`
    FOREIGN KEY (`Tema_idTema`)
    REFERENCES `SoftwareEducativo`.`Tema` (`idTema`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SoftwareEducativo`.`Opcion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SoftwareEducativo`.`Opcion` (
  `idOpcion` INT NOT NULL AUTO_INCREMENT,
  `Enunciado` VARCHAR(255) NOT NULL,
  `Correcta` TINYINT NOT NULL,
  `Pregunta_idPregunta` INT NOT NULL,
  PRIMARY KEY (`idOpcion`),
  INDEX `fk_Respuesta_Pregunta1_idx` (`Pregunta_idPregunta` ASC) VISIBLE,
  CONSTRAINT `fk_Respuesta_Pregunta1`
    FOREIGN KEY (`Pregunta_idPregunta`)
    REFERENCES `SoftwareEducativo`.`Pregunta` (`idPregunta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SoftwareEducativo`.`Curso_has_Modulo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SoftwareEducativo`.`Curso_has_Modulo` (
  `Curso_idCurso` INT NOT NULL,
  `Modulo_idModulo` INT NOT NULL,
  `Estado` TINYINT NOT NULL,
  PRIMARY KEY (`Curso_idCurso`, `Modulo_idModulo`),
  INDEX `fk_Curso_has_Modulo_Modulo1_idx` (`Modulo_idModulo` ASC) VISIBLE,
  INDEX `fk_Curso_has_Modulo_Curso1_idx` (`Curso_idCurso` ASC) VISIBLE,
  CONSTRAINT `fk_Curso_has_Modulo_Curso1`
    FOREIGN KEY (`Curso_idCurso`)
    REFERENCES `SoftwareEducativo`.`Curso` (`idCurso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Curso_has_Modulo_Modulo1`
    FOREIGN KEY (`Modulo_idModulo`)
    REFERENCES `SoftwareEducativo`.`Modulo` (`idModulo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SoftwareEducativo`.`UsuarioInscripcionCarrera`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SoftwareEducativo`.`UsuarioInscripcionCarrera` (
  `Usuario_idUsuario` VARCHAR(45) NOT NULL,
  `Carrera_idCarrera` INT NOT NULL,
  `fechaInscripcion` DATE NOT NULL,
  PRIMARY KEY (`Usuario_idUsuario`, `Carrera_idCarrera`),
  INDEX `fk_Usuario_has_Carrera_Carrera1_idx` (`Carrera_idCarrera` ASC) VISIBLE,
  INDEX `fk_Usuario_has_Carrera_Usuario1_idx` (`Usuario_idUsuario` ASC) VISIBLE,
  CONSTRAINT `fk_Usuario_has_Carrera_Usuario1`
    FOREIGN KEY (`Usuario_idUsuario`)
    REFERENCES `SoftwareEducativo`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_has_Carrera_Carrera1`
    FOREIGN KEY (`Carrera_idCarrera`)
    REFERENCES `SoftwareEducativo`.`Carrera` (`idCarrera`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SoftwareEducativo`.`UsuarioPresentaExamen`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SoftwareEducativo`.`UsuarioPresentaExamen` (
  `idExamenPresentado` INT NOT NULL AUTO_INCREMENT,
  `Examen_idExamen` INT NOT NULL,
  `Calificacion` DOUBLE NOT NULL,
  `HoraInicio` DATETIME NOT NULL,
  `HoraFin` DATETIME NOT NULL,
  `UsuarioInscripcionCarrera_Usuario_idUsuario` VARCHAR(45) NOT NULL,
  `UsuarioInscripcionCarrera_Carrera_idCarrera` INT NOT NULL,
  PRIMARY KEY (`idExamenPresentado`, `Examen_idExamen`, `UsuarioInscripcionCarrera_Usuario_idUsuario`, `UsuarioInscripcionCarrera_Carrera_idCarrera`),
  INDEX `fk_Usuario_has_Examen_Examen1_idx` (`Examen_idExamen` ASC) VISIBLE,
  INDEX `fk_UsuarioPresentaExamen_UsuarioInscripcionCarrera1_idx` (`UsuarioInscripcionCarrera_Usuario_idUsuario` ASC, `UsuarioInscripcionCarrera_Carrera_idCarrera` ASC) VISIBLE,
  CONSTRAINT `fk_Usuario_has_Examen_Examen1`
    FOREIGN KEY (`Examen_idExamen`)
    REFERENCES `SoftwareEducativo`.`Examen` (`idExamen`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_UsuarioPresentaExamen_UsuarioInscripcionCarrera1`
    FOREIGN KEY (`UsuarioInscripcionCarrera_Usuario_idUsuario` , `UsuarioInscripcionCarrera_Carrera_idCarrera`)
    REFERENCES `SoftwareEducativo`.`UsuarioInscripcionCarrera` (`Usuario_idUsuario` , `Carrera_idCarrera`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SoftwareEducativo`.`Examen_has_Pregunta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SoftwareEducativo`.`Examen_has_Pregunta` (
  `Examen_idExamen` INT NOT NULL,
  `Pregunta_idPregunta` INT NOT NULL,
  PRIMARY KEY (`Examen_idExamen`, `Pregunta_idPregunta`),
  INDEX `fk_Examen_has_Pregunta_Pregunta1_idx` (`Pregunta_idPregunta` ASC) VISIBLE,
  INDEX `fk_Examen_has_Pregunta_Examen1_idx` (`Examen_idExamen` ASC) VISIBLE,
  CONSTRAINT `fk_Examen_has_Pregunta_Examen1`
    FOREIGN KEY (`Examen_idExamen`)
    REFERENCES `SoftwareEducativo`.`Examen` (`idExamen`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Examen_has_Pregunta_Pregunta1`
    FOREIGN KEY (`Pregunta_idPregunta`)
    REFERENCES `SoftwareEducativo`.`Pregunta` (`idPregunta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SoftwareEducativo`.`UsuarioVeTema`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SoftwareEducativo`.`UsuarioVeTema` (
  `Tema_idTema` INT NOT NULL,
  `estado` TINYINT NOT NULL,
  `UsuarioInscripcionCarrera_Usuario_idUsuario` VARCHAR(45) NOT NULL,
  `UsuarioInscripcionCarrera_Carrera_idCarrera` INT NOT NULL,
  PRIMARY KEY (`Tema_idTema`, `UsuarioInscripcionCarrera_Usuario_idUsuario`, `UsuarioInscripcionCarrera_Carrera_idCarrera`),
  INDEX `fk_Usuario_has_Tema_Tema1_idx` (`Tema_idTema` ASC) VISIBLE,
  INDEX `fk_UsuarioVeTema_UsuarioInscripcionCarrera1_idx` (`UsuarioInscripcionCarrera_Usuario_idUsuario` ASC, `UsuarioInscripcionCarrera_Carrera_idCarrera` ASC) VISIBLE,
  CONSTRAINT `fk_Usuario_has_Tema_Tema1`
    FOREIGN KEY (`Tema_idTema`)
    REFERENCES `SoftwareEducativo`.`Tema` (`idTema`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_UsuarioVeTema_UsuarioInscripcionCarrera1`
    FOREIGN KEY (`UsuarioInscripcionCarrera_Usuario_idUsuario` , `UsuarioInscripcionCarrera_Carrera_idCarrera`)
    REFERENCES `SoftwareEducativo`.`UsuarioInscripcionCarrera` (`Usuario_idUsuario` , `Carrera_idCarrera`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `SoftwareEducativo` ;

-- -----------------------------------------------------
-- Placeholder table for view `SoftwareEducativo`.`view1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SoftwareEducativo`.`view1` (`id` INT);

-- -----------------------------------------------------
-- View `SoftwareEducativo`.`view1`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SoftwareEducativo`.`view1`;
USE `SoftwareEducativo`;

-- -----------------------------------------------------
-- Default data 
-- -----------------------------------------------------
INSERT INTO identificacion VALUE (1,"cedula");
INSERT INTO rol VALUE (1,"estudiante");
-- INSERT INTO persona VALUE (1234,1,"default",null,"default",null,'2000-01-01',1,null);
-- INSERT INTO usuario (idusuario,Persona_cedula,correo,contrasena) VALUE ("default",1234,"default@gmail.com","12345678");

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

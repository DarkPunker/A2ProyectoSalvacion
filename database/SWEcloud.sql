-- -----------------------------------------------------
-- Table `Identificacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Identificacion` (
  `idIdentificacion` INT NOT NULL AUTO_INCREMENT,
  `Tipo` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`idIdentificacion`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Persona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Persona` (
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
    REFERENCES `Identificacion` (`idIdentificacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Telefono`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Telefono` (
  `NumeroTelefono` VARCHAR(10) NOT NULL,
  `Persona_idPersona` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`NumeroTelefono`, `Persona_idPersona`),
  INDEX `fk_Telefono_Persona1_idx` (`Persona_idPersona` ASC) VISIBLE,
  CONSTRAINT `fk_Telefono_Persona1`
    FOREIGN KEY (`Persona_idPersona`)
    REFERENCES `Persona` (`idPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Rol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Rol` (
  `idRol` INT NOT NULL AUTO_INCREMENT,
  `NombreRol` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idRol`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Usuario` (
  `idUsuario` VARCHAR(45) NOT NULL,
  `Rol_idRol` INT DEFAULT 1,
  `Persona_cedula` VARCHAR(45) NOT NULL,
  `EstadoUsuario` TINYINT DEFAULT 1,
  `Correo` VARCHAR(45) NOT NULL,
  `Contrasena` VARCHAR(255) NOT NULL,
  INDEX `fk_Tripulante_Rol1_idx` (`Rol_idRol` ASC) VISIBLE,
  INDEX `fk_Tripulante_Persona1_idx` (`Persona_cedula` ASC) VISIBLE,
  UNIQUE INDEX `Correo_UNIQUE` (`Correo` ASC) VISIBLE,
  PRIMARY KEY (`idUsuario`),
  CONSTRAINT `fk_Tripulante_Rol1`
    FOREIGN KEY (`Rol_idRol`)
    REFERENCES `Rol` (`idRol`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tripulante_Persona1`
    FOREIGN KEY (`Persona_cedula`)
    REFERENCES `Persona` (`idPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Carrera`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Carrera` (
  `idCarrera` INT NOT NULL AUTO_INCREMENT,
  `NombreCurso` VARCHAR(60) NOT NULL,
  `DescripcionCurso` VARCHAR(255) NOT NULL,
  `EstadoCarrera` TINYINT DEFAULT 1,
  UNIQUE INDEX `CarreraNombre_UNIQUE` (`NombreCurso` ASC) VISIBLE,
  PRIMARY KEY (`idCarrera`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Modulo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Modulo` (
  `idModulo` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `EstadoModulo` TINYINT DEFAULT 1,
  UNIQUE INDEX `ModuloNombre_UNIQUE` (`Nombre` ASC) VISIBLE,
  PRIMARY KEY (`idModulo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Unidad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Unidad` (
  `idUnidad` INT NOT NULL AUTO_INCREMENT,
  `NombreUnidad` VARCHAR(45) NOT NULL,
  `Modulo_idModulo` INT NOT NULL,
  `EstadoUnidad` TINYINT DEFAULT 1,
  PRIMARY KEY (`idUnidad`),
  UNIQUE INDEX `UnidadNombre_UNIQUE` (`NombreUnidad` ASC) VISIBLE,
  INDEX `fk_Unidad_Modulo1_idx` (`Modulo_idModulo` ASC) VISIBLE,
  CONSTRAINT `fk_Unidad_Modulo1`
    FOREIGN KEY (`Modulo_idModulo`)
    REFERENCES `Modulo` (`idModulo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Curso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Curso` (
  `idCurso` INT NOT NULL AUTO_INCREMENT,
  `NombreSubCurso` VARCHAR(60) NOT NULL,
  `FechaInicio` DATE NULL,
  `FechaFin` DATE NULL,
  `Curso_idCurso` INT NOT NULL,
  `EstadoCurso` TINYINT DEFAULT 1,
  UNIQUE INDEX `CursoNombre_UNIQUE` (`NombreSubCurso` ASC) VISIBLE,
  PRIMARY KEY (`idCurso`),
  INDEX `fk_SubCurso_Curso1_idx` (`Curso_idCurso` ASC) VISIBLE,
  CONSTRAINT `fk_SubCurso_Curso1`
    FOREIGN KEY (`Curso_idCurso`)
    REFERENCES `Carrera` (`idCarrera`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Tema`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Tema` (
  `idTema` INT NOT NULL AUTO_INCREMENT,
  `NombreTema` VARCHAR(60) NOT NULL,
  `Unidad_idUnidad` INT NOT NULL,
  `EstadoTema` TINYINT DEFAULT 1,
  PRIMARY KEY (`idTema`),
  UNIQUE INDEX `TemaNombre_UNIQUE` (`NombreTema` ASC) VISIBLE,
  INDEX `fk_Tema_Unidad1_idx` (`Unidad_idUnidad` ASC) VISIBLE,
  CONSTRAINT `fk_Tema_Unidad1`
    FOREIGN KEY (`Unidad_idUnidad`)
    REFERENCES `Unidad` (`idUnidad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TipoMultimedia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TipoMultimedia` (
  `idTipoMultimedia` INT NOT NULL AUTO_INCREMENT,
  `TipoMultimedia` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTipoMultimedia`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Multimedia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Multimedia` (
  `idMultimedia` INT NOT NULL AUTO_INCREMENT,
  `NombreMultimedia` VARCHAR(60) NOT NULL,
  `DescripcionMultimedia` TEXT NULL,
  `Direccion` VARCHAR(255) NULL,
  `EstadoMultimedia` TINYINT NOT NULL DEFAULT 1,
  `Tema_idTema` INT NOT NULL,
  `TipoMultimedia_idTipoMultimedia` INT NOT NULL,
  PRIMARY KEY (`idMultimedia`),
  INDEX `fk_Video_Tema1_idx` (`Tema_idTema` ASC) VISIBLE,
  INDEX `fk_Multimedia_TipoMultimedia1_idx` (`TipoMultimedia_idTipoMultimedia` ASC) VISIBLE,
  CONSTRAINT `fk_Video_Tema1`
    FOREIGN KEY (`Tema_idTema`)
    REFERENCES `Tema` (`idTema`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Multimedia_TipoMultimedia1`
    FOREIGN KEY (`TipoMultimedia_idTipoMultimedia`)
    REFERENCES `TipoMultimedia` (`idTipoMultimedia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Examen`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Examen` (
  `idExamen` INT NOT NULL AUTO_INCREMENT,
  `NombreExamen` VARCHAR(45) NOT NULL,
  `EstadoExamen` TINYINT NOT NULL DEFAULT 1,
  PRIMARY KEY (`idExamen`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Pregunta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Pregunta` (
  `idPregunta` INT NOT NULL AUTO_INCREMENT,
  `Pregunta` VARCHAR(255) NOT NULL,
  `Tema_idTema` INT NOT NULL,
  PRIMARY KEY (`idPregunta`),
  INDEX `fk_Pregunta_Tema1_idx` (`Tema_idTema` ASC) VISIBLE,
  CONSTRAINT `fk_Pregunta_Tema1`
    FOREIGN KEY (`Tema_idTema`)
    REFERENCES `Tema` (`idTema`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Opcion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Opcion` (
  `idOpcion` INT NOT NULL AUTO_INCREMENT,
  `Enunciado` VARCHAR(255) NOT NULL,
  `Correcta` TINYINT NOT NULL,
  `Pregunta_idPregunta` INT NOT NULL,
  PRIMARY KEY (`idOpcion`),
  INDEX `fk_Respuesta_Pregunta1_idx` (`Pregunta_idPregunta` ASC) VISIBLE,
  CONSTRAINT `fk_Respuesta_Pregunta1`
    FOREIGN KEY (`Pregunta_idPregunta`)
    REFERENCES `Pregunta` (`idPregunta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Curso_has_Modulo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Curso_has_Modulo` (
  `Curso_idCurso` INT NOT NULL,
  `Modulo_idModulo` INT NOT NULL,
  `Estado` TINYINT NOT NULL,
  PRIMARY KEY (`Curso_idCurso`, `Modulo_idModulo`),
  INDEX `fk_Curso_has_Modulo_Modulo1_idx` (`Modulo_idModulo` ASC) VISIBLE,
  INDEX `fk_Curso_has_Modulo_Curso1_idx` (`Curso_idCurso` ASC) VISIBLE,
  CONSTRAINT `fk_Curso_has_Modulo_Curso1`
    FOREIGN KEY (`Curso_idCurso`)
    REFERENCES `Curso` (`idCurso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Curso_has_Modulo_Modulo1`
    FOREIGN KEY (`Modulo_idModulo`)
    REFERENCES `Modulo` (`idModulo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `UsuarioInscripcionCarrera`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `UsuarioInscripcionCarrera` (
  `Usuario_idUsuario` VARCHAR(45) NOT NULL,
  `Carrera_idCarrera` INT NOT NULL,
  `fechaInscripcion` timestamp NOT NULL DEFAULT current_timestamp,
  PRIMARY KEY (`Usuario_idUsuario`, `Carrera_idCarrera`),
  INDEX `fk_Usuario_has_Carrera_Carrera1_idx` (`Carrera_idCarrera` ASC) VISIBLE,
  INDEX `fk_Usuario_has_Carrera_Usuario1_idx` (`Usuario_idUsuario` ASC) VISIBLE,
  CONSTRAINT `fk_Usuario_has_Carrera_Usuario1`
    FOREIGN KEY (`Usuario_idUsuario`)
    REFERENCES `Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_has_Carrera_Carrera1`
    FOREIGN KEY (`Carrera_idCarrera`)
    REFERENCES `Carrera` (`idCarrera`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `UsuarioPresentaExamen`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `UsuarioPresentaExamen` (
  `idExamenPresentado` INT NOT NULL AUTO_INCREMENT,
  `Examen_idExamen` INT NOT NULL,
  `Calificacion` DOUBLE NOT NULL DEFAULT 1,
  `HoraInicio` timestamp NOT NULL DEFAULT current_timestamp,
  `HoraFin` DATETIME NULL,
  `UsuarioInscripcionCarrera_Usuario_idUsuario` VARCHAR(45) NOT NULL,
  `UsuarioInscripcionCarrera_Carrera_idCarrera` INT NOT NULL,
  PRIMARY KEY (`idExamenPresentado`, `Examen_idExamen`, `UsuarioInscripcionCarrera_Usuario_idUsuario`, `UsuarioInscripcionCarrera_Carrera_idCarrera`),
  INDEX `fk_Usuario_has_Examen_Examen1_idx` (`Examen_idExamen` ASC) VISIBLE,
  INDEX `fk_UsuarioPresentaExamen_UsuarioInscripcionCarrera1_idx` (`UsuarioInscripcionCarrera_Usuario_idUsuario` ASC, `UsuarioInscripcionCarrera_Carrera_idCarrera` ASC) VISIBLE,
  CONSTRAINT `fk_Usuario_has_Examen_Examen1`
    FOREIGN KEY (`Examen_idExamen`)
    REFERENCES `Examen` (`idExamen`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_UsuarioPresentaExamen_UsuarioInscripcionCarrera1`
    FOREIGN KEY (`UsuarioInscripcionCarrera_Usuario_idUsuario` , `UsuarioInscripcionCarrera_Carrera_idCarrera`)
    REFERENCES `UsuarioInscripcionCarrera` (`Usuario_idUsuario` , `Carrera_idCarrera`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Examen_has_Pregunta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Examen_has_Pregunta` (
  `Examen_idExamen` INT NOT NULL,
  `Pregunta_idPregunta` INT NOT NULL,
  PRIMARY KEY (`Examen_idExamen`, `Pregunta_idPregunta`),
  INDEX `fk_Examen_has_Pregunta_Pregunta1_idx` (`Pregunta_idPregunta` ASC) VISIBLE,
  INDEX `fk_Examen_has_Pregunta_Examen1_idx` (`Examen_idExamen` ASC) VISIBLE,
  CONSTRAINT `fk_Examen_has_Pregunta_Examen1`
    FOREIGN KEY (`Examen_idExamen`)
    REFERENCES `Examen` (`idExamen`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Examen_has_Pregunta_Pregunta1`
    FOREIGN KEY (`Pregunta_idPregunta`)
    REFERENCES `Pregunta` (`idPregunta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `UsuarioVeTema`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `UsuarioVeTema` (
  `Tema_idTema` INT NOT NULL,
  `fechaVista` timestamp NOT NULL DEFAULT current_timestamp,
  `UsuarioInscripcionCarrera_Usuario_idUsuario` VARCHAR(45) NOT NULL,
  `UsuarioInscripcionCarrera_Carrera_idCarrera` INT NOT NULL,
  PRIMARY KEY (`Tema_idTema`, `UsuarioInscripcionCarrera_Usuario_idUsuario`, `UsuarioInscripcionCarrera_Carrera_idCarrera`),
  INDEX `fk_Usuario_has_Tema_Tema1_idx` (`Tema_idTema` ASC) VISIBLE,
  INDEX `fk_UsuarioVeTema_UsuarioInscripcionCarrera1_idx` (`UsuarioInscripcionCarrera_Usuario_idUsuario` ASC, `UsuarioInscripcionCarrera_Carrera_idCarrera` ASC) VISIBLE,
  CONSTRAINT `fk_Usuario_has_Tema_Tema1`
    FOREIGN KEY (`Tema_idTema`)
    REFERENCES `Tema` (`idTema`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_UsuarioVeTema_UsuarioInscripcionCarrera1`
    FOREIGN KEY (`UsuarioInscripcionCarrera_Usuario_idUsuario` , `UsuarioInscripcionCarrera_Carrera_idCarrera`)
    REFERENCES `UsuarioInscripcionCarrera` (`Usuario_idUsuario` , `Carrera_idCarrera`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Curso_has_Examen`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Curso_has_Examen` (
  `Curso_idCurso` INT NOT NULL,
  `Examen_idExamen` INT NOT NULL,
  `Estado` TINYINT NOT NULL DEFAULT 1,
  PRIMARY KEY (`Curso_idCurso`, `Examen_idExamen`),
  INDEX `fk_Curso_has_Examen_Examen1_idx` (`Examen_idExamen` ASC) VISIBLE,
  INDEX `fk_Curso_has_Examen_Curso1_idx` (`Curso_idCurso` ASC) VISIBLE,
  CONSTRAINT `fk_Curso_has_Examen_Curso1`
    FOREIGN KEY (`Curso_idCurso`)
    REFERENCES `Curso` (`idCurso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Curso_has_Examen_Examen1`
    FOREIGN KEY (`Examen_idExamen`)
    REFERENCES `Examen` (`idExamen`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Registro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Registro` (
  `idRegistro` INT NOT NULL AUTO_INCREMENT,
  `NombreTabla` VARCHAR(45) NOT NULL,
  `Usuario` VARCHAR(45) NOT NULL,
  `idTablaRegistro` VARCHAR(45) NOT NULL,
  `Accion` VARCHAR(45) NOT NULL,
  `Descripcion` TEXT NOT NULL,
  `FechaRegistro` timestamp NOT NULL DEFAULT current_timestamp,
  PRIMARY KEY (`idRegistro`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Trigger
-- -----------------------------------------------------
DROP TRIGGER IF EXISTS `trAITema`;
DELIMITER $$
CREATE TRIGGER `trAITema` 
AFTER INSERT
ON `Tema` FOR EACH ROW
BEGIN
DECLARE Descripcion TEXT;
SET Descripcion = CONCAT('Nombre: ',NEW.NombreTema,' Estado: ',NEW.EstadoTema);   
CALL insertInRegistro ("Tema","",NEW.idTema,"INSERT", Descripcion);
END $$
DELIMITER ;

DROP TRIGGER IF EXISTS `trAUTema`;
DELIMITER $$
CREATE TRIGGER `trAUTema` 
AFTER UPDATE
ON `Tema` FOR EACH ROW
BEGIN
DECLARE Descripcion TEXT;
SET Descripcion = CONCAT('Nombre: ',OLD.NombreTema,'=>',NEW.NombreTema,' Estado: ',OLD.EstadoTema,'=>',NEW.EstadoTema);   
CALL insertInRegistro ("Tema","",NEW.idTema,"UPDATE", Descripcion);
END $$
DELIMITER ;

DROP TRIGGER IF EXISTS `trAUCarrera`;
DELIMITER $$
CREATE TRIGGER `trAUCarrera` 
AFTER UPDATE
ON `Carrera` FOR EACH ROW
BEGIN
DECLARE verificar TINYINT;
IF NEW.EstadoCarrera = 0 THEN
UPDATE Curso SET EstadoCurso = 0 WHERE Curso.EstadoCurso = 1 AND Curso.Curso_idCurso = NEW.idCarrera;
END IF;
IF NEW.EstadoCarrera = 1 THEN
UPDATE Curso SET EstadoCurso = 1 WHERE Curso.EstadoCurso = 0 AND Curso.Curso_idCurso = NEW.idCarrera;
END IF;
END $$
DELIMITER ;

DROP TRIGGER IF EXISTS `trAUCurso`;
DELIMITER $$
CREATE TRIGGER `trAUCurso` 
AFTER UPDATE
ON `Curso` FOR EACH ROW
BEGIN
IF NEW.EstadoCurso = 0 THEN
UPDATE Curso_has_Modulo SET Estado = 0 WHERE Curso_has_Modulo.Estado = 1 AND Curso_has_Modulo.Curso_idCurso = NEW.idCurso;
END IF;
IF NEW.EstadoCurso = 1 THEN
UPDATE Curso_has_Modulo SET Estado = 1 WHERE Curso_has_Modulo.Estado = 0 AND Curso_has_Modulo.Curso_idCurso = NEW.idCurso;
END IF;
END $$
DELIMITER ;

DROP TRIGGER IF EXISTS `trAUCurso_has_Modulo`;
DELIMITER $$
CREATE TRIGGER `trAUCurso_has_Modulo` 
AFTER UPDATE
ON `Curso_has_Modulo` FOR EACH ROW
BEGIN
IF NEW.Estado = 0 THEN
UPDATE Modulo SET EstadoModulo = 0 WHERE Modulo.EstadoModulo = 1 AND Modulo.idModulo = NEW.Modulo_idModulo;
END IF;
IF NEW.Estado = 1 THEN
UPDATE Modulo SET EstadoModulo = 1 WHERE Modulo.EstadoModulo = 0 AND Modulo.idModulo = NEW.Modulo_idModulo;
END IF;
END $$
DELIMITER ;

DROP TRIGGER IF EXISTS `trAUModulo`;
DELIMITER $$
CREATE TRIGGER `trAUModulo` 
AFTER UPDATE
ON `Modulo` FOR EACH ROW
BEGIN
IF NEW.EstadoModulo = 0 THEN
UPDATE Unidad SET EstadoUnidad = 0 WHERE Unidad.EstadoUnidad = 1 AND Unidad.Modulo_idModulo = NEW.idModulo;
END IF;
IF NEW.EstadoModulo = 1 THEN
UPDATE Unidad SET EstadoUnidad = 1 WHERE Unidad.EstadoUnidad = 0 AND Unidad.Modulo_idModulo = NEW.idModulo;
END IF;
END $$
DELIMITER ;

DROP TRIGGER IF EXISTS `trAUUnidad`;
DELIMITER $$
CREATE TRIGGER `trAUUnidad` 
AFTER UPDATE
ON `Unidad` FOR EACH ROW
BEGIN
IF NEW.EstadoUnidad = 0 THEN
UPDATE Tema SET EstadoTema = 0 WHERE Tema.EstadoTema = 1 AND Tema.Unidad_idUnidad = NEW.idUnidad;
END IF;
IF NEW.EstadoUnidad = 1 THEN
UPDATE Tema SET EstadoTema = 1 WHERE Tema.EstadoTema = 0 AND Tema.Unidad_idUnidad = NEW.idUnidad;
END IF;
END $$
DELIMITER ;
-- -----------------------------------------------------
-- Procedure
-- -----------------------------------------------------
DROP PROCEDURE IF EXISTS `insertInRegistro`;
DELIMITER $$
CREATE PROCEDURE `insertInRegistro` (
  IN inNombreTabla VARCHAR(45),
  IN inUsuario VARCHAR(45),
  IN inidTablaRegistro VARCHAR(45),
  IN inAccion VARCHAR(45),
  IN inDescripcion TEXT
)
BEGIN
INSERT INTO Registro (NombreTabla, Usuario, idTablaRegistro, Accion, Descripcion) 
VALUE (inNombreTabla, inUsuario, inidTablaRegistro, inAccion, inDescripcion);
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS `UsuarioPersonaTelefono`;
DELIMITER $$
CREATE PROCEDURE `UsuarioPersonaTelefono` (
  IN inidUsuario VARCHAR(45))
BEGIN
SELECT Usuario.idUsuario, Usuario.Correo, Persona.idPersona, 
Persona.Nombre1, Persona.Nombre2, Persona.Apellido1, Persona.Apellido2,
Persona.FechaNacimiento, Persona.Direccion_idBarrio, Telefono.NumeroTelefono,
CASE
  WHEN Persona.sexo != 0 THEN "Masculino"
  ELSE "femenino"
END AS sexo
FROM Usuario
INNER JOIN Persona
ON Persona.idPersona = Usuario.Persona_cedula
LEFT JOIN Telefono
ON Persona.idPersona = Telefono.Persona_idPersona
WHERE Usuario.idUsuario = inidUsuario;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS `addPersonaUsuario`;
DELIMITER $$
CREATE PROCEDURE `addPersonaUsuario` (
  IN inidUsuario VARCHAR(45),
  IN incorreo VARCHAR(45),
  IN incontrasena VARCHAR(255),
  IN inidPersona VARCHAR(45),
  IN innombre1 VARCHAR(45),
  IN inapellido1 VARCHAR(45),
  IN infechaNacimiento DATE,
  IN insexo TINYINT
  )
BEGIN
INSERT INTO Persona (idPersona, Nombre1, Apellido1, FechaNacimiento, Sexo) VALUE (inidPersona, innombre1, inapellido1, infechaNacimiento, insexo);
INSERT INTO Usuario (idUsuario, Persona_cedula, Correo, Contrasena )VALUE (inidUsuario, inidPersona, incorreo, incontrasena);
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS `returnIfNotExistOrNotCarreraName`;
DELIMITER $$
CREATE PROCEDURE `returnIfNotExistOrNotCarreraName` (
  IN inNombreCarrera VARCHAR(60),
  OUT exist BOOLEAN
)
BEGIN
DECLARE valor VARCHAR(60);
SELECT LENGTH(Carrera.NombreCurso) INTO valor FROM Carrera WHERE NombreCurso = inNombreCarrera;
IF valor > 0 THEN
SET exist = TRUE;
ELSE
SET exist = FALSE;
END IF;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS `addCarrera`;
DELIMITER $$
CREATE PROCEDURE `addCarrera` (
  IN inNombreCarrera VARCHAR(60),
  IN inDescripcionCarrera VARCHAR(255)
  )
BEGIN
INSERT INTO Carrera (NombreCurso, DescripcionCurso) VALUE ( inNombreCarrera, inDescripcionCarrera);
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS `addModulo`;
DELIMITER $$
CREATE PROCEDURE `addModulo` (
  IN inidCurso INT,
  IN inNombreModulo VARCHAR(45)
  )
BEGIN
DECLARE varidModulo INT;
INSERT INTO Modulo VALUE (NULL, inNombreModulo);
SELECT LAST_INSERT_ID() INTO varidModulo;
INSERT INTO Curso_has_Modulo VALUE (inidCurso, varidModulo, 1);
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS `seeModulo`;
DELIMITER $$
CREATE PROCEDURE `seeModulo` (
  IN inidCurso INT
)
BEGIN
SELECT Modulo.idModulo, Modulo.Nombre 
FROM Curso_has_Modulo
INNER JOIN Modulo
ON Modulo.idModulo = Curso_has_Modulo.Modulo_idModulo
WHERE Curso_has_Modulo.Curso_idCurso = inidCurso;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS `seeModuloidCarreraidCurso`;
DELIMITER $$
CREATE PROCEDURE `seeModuloidCarreraidCurso` (
  IN inidCurso INT
)
BEGIN
SELECT Modulo.idModulo, Modulo.Nombre, Carrera.idCarrera, Curso.idCurso 
FROM Carrera
INNER JOIN Curso
ON Carrera.idCarrera = Curso.Curso_idCurso
INNER JOIN Curso_has_Modulo
ON Curso.idCurso = Curso_has_Modulo.Curso_idCurso
INNER JOIN Modulo
ON Modulo.idModulo = Curso_has_Modulo.Modulo_idModulo
WHERE Curso_has_Modulo.Curso_idCurso = inidCurso;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS `seeUnidadTema`;
DELIMITER $$
CREATE PROCEDURE `seeUnidadTema` (
  IN inidModulo INT
)
BEGIN
SELECT idUnidad, NombreUnidad, GROUP_CONCAT(Modulo_idModulo,':',idTema, ':', NombreTema separator '-') as respuestas
FROM Tema
INNER JOIN Unidad
ON Unidad.idUnidad = Tema.Unidad_idUnidad
WHERE Unidad.Modulo_idModulo = inidModulo
GROUP BY Unidad.idUnidad;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS `seePreguntas`;
DELIMITER $$
CREATE PROCEDURE `seePreguntas` (
  IN inidCurso INT
)
BEGIN
SELECT *
FROM Curso_has_Modulo
INNER JOIN Modulo
ON Modulo.idModulo = Curso_has_Modulo.Modulo_idModulo
INNER JOIN Unidad
ON Modulo.idModulo = Unidad.Modulo_idModulo
INNER JOIN Tema
ON Unidad.idUnidad = Tema.Unidad_idUnidad
INNER JOIN Pregunta
ON Tema.idTema = Pregunta.Tema_idTema
WHERE Curso_has_Modulo.Curso_idCurso = inidCurso;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS `seeOpciones`;
DELIMITER $$
CREATE PROCEDURE `seeOpciones` (
  IN inidCurso INT
)
BEGIN
SELECT idPregunta, Pregunta, Correcta, GROUP_CONCAT(idOpcion, ':', Enunciado separator '-') as respuestas
FROM Curso_has_Modulo
INNER JOIN Modulo
ON Modulo.idModulo = Curso_has_Modulo.Modulo_idModulo
INNER JOIN Unidad
ON Modulo.idModulo = Unidad.Modulo_idModulo
INNER JOIN Tema
ON Unidad.idUnidad = Tema.Unidad_idUnidad
INNER JOIN Pregunta
ON Tema.idTema = Pregunta.Tema_idTema
INNER JOIN Opcion
ON Pregunta.idPregunta = Opcion.Pregunta_idPregunta
WHERE Curso_has_Modulo.Curso_idCurso = inidCurso
GROUP BY Pregunta.idPregunta;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS `ExamPreguntasOpciones`;
DELIMITER $$
CREATE PROCEDURE `ExamPreguntasOpciones` (
  IN inidExamen INT
)
BEGIN
SELECT idPregunta, Pregunta, GROUP_CONCAT(idPregunta, ':',idOpcion, ':', Enunciado separator '-') as respuestas
FROM Curso_has_Examen 
INNER JOIN Examen
ON Examen.idExamen = Curso_has_Examen.Examen_idExamen
INNER JOIN Examen_has_Pregunta
ON Examen.idExamen = Examen_has_Pregunta.Examen_idExamen
INNER JOIN Pregunta
ON Pregunta.idPregunta = Examen_has_Pregunta.Pregunta_idPregunta
INNER JOIN Opcion
ON Pregunta.idPregunta = Opcion.Pregunta_idPregunta
WHERE Examen.idExamen = inidExamen
GROUP BY Pregunta.idPregunta;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS `seeOpcionesComparacion`;
DELIMITER $$
CREATE PROCEDURE `seeOpcionesComparacion` (
  IN inidExamen INT
)
BEGIN
SELECT idPregunta, Pregunta, idOpcion, Enunciado, Correcta
FROM Curso_has_Examen 
INNER JOIN Examen
ON Examen.idExamen = Curso_has_Examen.Examen_idExamen
INNER JOIN Examen_has_Pregunta
ON Examen.idExamen = Examen_has_Pregunta.Examen_idExamen
INNER JOIN Pregunta
ON Pregunta.idPregunta = Examen_has_Pregunta.Pregunta_idPregunta
INNER JOIN Opcion
ON Pregunta.idPregunta = Opcion.Pregunta_idPregunta
WHERE Examen.idExamen = inidExamen AND Opcion.Correcta = 1;
END $$
DELIMITER ;



DROP PROCEDURE IF EXISTS `seeExamCountPreguntas`;
DELIMITER $$
CREATE PROCEDURE `seeExamCountPreguntas` (
  IN inidCurso INT
)
BEGIN
SELECT Examen.idExamen, Examen.NombreExamen, COUNT(Examen_has_Pregunta.Pregunta_idPregunta)AS Cantidad
FROM Curso_has_Examen 
INNER JOIN Examen
ON Examen.idExamen = Curso_has_Examen.Examen_idExamen 
LEFT JOIN Examen_has_Pregunta
ON Examen.idExamen = Examen_has_Pregunta.Examen_idExamen
WHERE Curso_idCurso = inidCurso
GROUP BY Examen.idExamen
ORDER BY Examen.idExamen ASC;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS `seeTemaCountPreguntas`;
DELIMITER $$
CREATE PROCEDURE `seeTemaCountPreguntas` (
  IN inidCurso INT
)
BEGIN
SELECT Tema.idTema, Tema.NombreTema, COUNT(Pregunta.idPregunta) AS Cantidad
FROM Curso_has_Modulo
INNER JOIN Modulo
ON Modulo.idModulo = Curso_has_Modulo.Modulo_idModulo
INNER JOIN Unidad
ON Modulo.idModulo = Unidad.Modulo_idModulo
INNER JOIN Tema
ON Unidad.idUnidad = Tema.Unidad_idUnidad
LEFT JOIN Pregunta
ON Tema.idTema = Pregunta.Tema_idTema
WHERE Curso_has_Modulo.Curso_idCurso = inidCurso
GROUP BY Tema.idTema
ORDER BY Tema.idTema ASC;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS `seeTemaPreguntasRespuestas`;
DELIMITER $$
CREATE PROCEDURE `seeTemaPreguntasRespuestas` (
  IN inidTema INT
)
BEGIN
SELECT * 
FROM Tema
INNER JOIN Pregunta
ON Tema.idTema = Pregunta.Tema_idTema
INNER JOIN Opcion
ON Pregunta.idPregunta = Opcion.Pregunta_idPregunta
WHERE Tema.idTema = inidTema
ORDER BY Tema.idTema ASC;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS `seePreguntasRespuestasNuevo`;
DELIMITER $$
CREATE PROCEDURE `seePreguntasRespuestasNuevo` (
  IN inidTema INT
)
BEGIN
SELECT idPregunta, Pregunta, idOpcion, Correcta, GROUP_CONCAT(idOpcion, ':', Enunciado separator '-') as respuestas
FROM Pregunta
INNER JOIN Opcion
ON Pregunta.idPregunta = Opcion.Pregunta_idPregunta
WHERE Pregunta.Tema_idTema = inidTema
GROUP BY Pregunta.idPregunta;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS `seeTemaCountMultimedia`;
DELIMITER $$
CREATE PROCEDURE `seeTemaCountMultimedia` (
  IN inidCurso INT
)
BEGIN
SELECT Tema.idTema, Tema.NombreTema, COUNT(Multimedia.idMultimedia)AS Cantidad
FROM Curso_has_Modulo
INNER JOIN Modulo
ON Modulo.idModulo = Curso_has_Modulo.Modulo_idModulo
INNER JOIN Unidad
ON Modulo.idModulo = Unidad.Modulo_idModulo
INNER JOIN Tema
ON Unidad.idUnidad = Tema.Unidad_idUnidad
LEFT JOIN Multimedia
ON Tema.idTema = Multimedia.Tema_idTema
WHERE Curso_has_Modulo.Curso_idCurso = inidCurso
GROUP BY Tema.idTema
ORDER BY Tema.idTema ASC;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS `seeUserRol`;
DELIMITER $$
CREATE PROCEDURE `seeUserRol` (
  IN inidUsuario VARCHAR(45)
)
BEGIN
SELECT Usuario.idUsuario AS nombre, Usuario.Rol_idRol AS Rol, 
Usuario.Persona_cedula AS identificacion, Usuario.EstadoUsuario AS estado, 
Usuario.Correo AS correo
FROM Usuario
WHERE Usuario.idUsuario = inidUsuario;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS `editUserAdmin`;
DELIMITER $$
CREATE PROCEDURE `editUserAdmin` (
  IN inidUser VARCHAR (45),
  IN inRol INT,
  IN inestado TINYINT
)
BEGIN
UPDATE Usuario 
SET Rol_idRol = inRol, EstadoUsuario = inestado 
WHERE Usuario.idUsuario = inidUser;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS `seeCarreraForId`;
DELIMITER $$
CREATE PROCEDURE `seeCarreraForId` (
  IN inidCarrera VARCHAR (45)
)
BEGIN
SELECT * 
FROM Carrera 
WHERE idCarrera = inidCarrera;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS `modificarCarrera`;
DELIMITER $$
CREATE PROCEDURE `modificarCarrera` (
  IN inidCarrera INT,
  IN inNombreCurso VARCHAR(60),
  IN inDescripcionCurso VARCHAR(255)
)
BEGIN
UPDATE Carrera 
SET NombreCurso = inNombreCurso, DescripcionCurso = inDescripcionCurso 
WHERE idCarrera = inidCarrera;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS `seeExamForUser`;
DELIMITER $$
CREATE PROCEDURE `seeExamForUser` (
  IN inidUsuario VARCHAR(45)
)
BEGIN
SELECT  Examen.NombreExamen, UsuarioPresentaExamen.Calificacion, UsuarioPresentaExamen.HoraInicio, 
UsuarioPresentaExamen.HoraFin
FROM Examen 
INNER JOIN UsuarioPresentaExamen 
ON Examen.idExamen = UsuarioPresentaExamen.Examen_idExamen 
WHERE UsuarioInscripcionCarrera_Usuario_idUsuario = inidUsuario AND HoraFin  IS NOT NULL;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS `getidCursoIsExam`;
DELIMITER $$
CREATE PROCEDURE `getidCursoIsExam` (
 IN inidExamen INT
)
BEGIN
SELECT Curso.Curso_idCurso, NombreExamen
FROM Examen
INNER JOIN Curso_has_Examen 
ON Curso_has_Examen.Examen_idExamen = Examen.idExamen 
INNER JOIN Curso 
ON Curso_has_Examen.Curso_idCurso = Curso.idCurso 
WHERE Examen_idExamen = inidExamen;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS `addUsuarioPresentaExamen`;
DELIMITER $$
CREATE PROCEDURE `addUsuarioPresentaExamen` (
  IN inidExamen INT,
  IN inidUsuario VARCHAR(45),
  IN inidCarrera INT
  )
BEGIN
INSERT INTO UsuarioPresentaExamen 
(UsuarioPresentaExamen.Examen_idExamen, UsuarioPresentaExamen.UsuarioInscripcionCarrera_Usuario_idUsuario, UsuarioPresentaExamen.UsuarioInscripcionCarrera_Carrera_idCarrera) 
VALUE (inidExamen, inidUsuario, inidCarrera);
SELECT LAST_INSERT_ID() AS insertId;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS `updateUsuarioPresentaExamen`;
DELIMITER $$
CREATE PROCEDURE `updateUsuarioPresentaExamen` (
  IN inCalificacion double,
  IN inHoraFin DATETIME,
  IN inidExamenPresentado INT
)
BEGIN
UPDATE UsuarioPresentaExamen 
SET Calificacion = inCalificacion, HoraFin = inHoraFin 
WHERE idExamenPresentado = inidExamenPresentado;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS `getExamenidAndName`;
DELIMITER $$
CREATE PROCEDURE `getExamenidAndName` (
  IN inidCurso INT
)
BEGIN
SELECT Examen.idExamen, Examen.NombreExamen
FROM Examen 
INNER JOIN Curso_has_Examen 
ON idExamen = Examen_idExamen 
WHERE Curso_idCurso = inidCurso;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS `getMultimediaIsTema`;
DELIMITER $$
CREATE PROCEDURE `getMultimediaIsTema` (
  IN inidTema INT
)
BEGIN
SELECT * 
FROM Tema 
INNER JOIN Multimedia 
ON idTema=Tema_idTema 
WHERE idTema = inidTema;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS `getCursoidCarrera`;
DELIMITER $$
CREATE PROCEDURE `getCursoidCarrera` (
  IN inidCurso INT
)
BEGIN
SELECT Curso.Curso_idCurso 
FROM Curso 
WHERE idCurso = inidCurso;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS `getUsuarioVeTema`;
DELIMITER $$
CREATE PROCEDURE `getUsuarioVeTema` (
  IN inidTema INT,
  IN inidUsuario VARCHAR(45),
  IN inidCurso INT
)
BEGIN
SELECT * 
FROM UsuarioVeTema 
WHERE Tema_idTema = inidTema
AND UsuarioInscripcionCarrera_Usuario_idUsuario = inidUsuario 
AND UsuarioInscripcionCarrera_Carrera_idCarrera = inidCurso;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS `addUsuarioVeTema`;
DELIMITER $$
CREATE PROCEDURE `addUsuarioVeTema` (
  IN inidTema INT,
  IN inidUsuario VARCHAR(45),
  IN inidCurso INT
)
BEGIN
INSERT INTO UsuarioVeTema (Tema_idTema, UsuarioInscripcionCarrera_Usuario_idUsuario, 
UsuarioInscripcionCarrera_Carrera_idCarrera) 
VALUE (inidTema, inidUsuario, inidCurso);
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS `getUsuarioInscripcionCarrera`;
DELIMITER $$
CREATE PROCEDURE `getUsuarioInscripcionCarrera` (
  IN inidCurso VARCHAR(45),
  IN inidCarrera INT
)
BEGIN
SELECT * 
FROM UsuarioInscripcionCarrera 
WHERE Usuario_idUsuario = inidCurso 
AND Carrera_idCarrera = inidCarrera;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS `UsuarioInscripcionCarrera`;
DELIMITER $$
CREATE PROCEDURE `UsuarioInscripcionCarrera` (
  IN inidUsuario VARCHAR(45),
  IN inidCarrera INT
)
BEGIN
INSERT INTO UsuarioInscripcionCarrera (Usuario_idUsuario, Carrera_idCarrera) 
VALUE (inidUsuario ,inidCarrera);
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS `getCursoidAndName`;
DELIMITER $$
CREATE PROCEDURE `getCursoidAndName` (
  IN inidCarrera INT
)
BEGIN
SELECT * 
FROM Carrera
INNER JOIN Curso
ON Curso.Curso_idCurso = Carrera.idCarrera
INNER JOIN Curso_has_Modulo
ON Curso_has_Modulo.Curso_idCurso = Curso.idCurso
WHERE Carrera.idCarrera = inidCarrera;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS `seeUsuarioForId`;
DELIMITER $$
CREATE PROCEDURE `seeUsuarioForId` (
  IN inidUsuario VARCHAR(45)
)
BEGIN
SELECT * 
FROM Usuario 
WHERE idUsuario = inidUsuario;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS `seePersonaForId`;
DELIMITER $$
CREATE PROCEDURE `seePersonaForId` (
  IN inidPersona VARCHAR(45)
)
BEGIN
SELECT * 
FROM Persona 
WHERE idPersona = inidPersona;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS `returnIfNotExistOrNotCursoName`;
DELIMITER $$
CREATE PROCEDURE `returnIfNotExistOrNotCursoName` (
  IN inNombreSubCurso VARCHAR(60),
  OUT exist BOOLEAN
)
BEGIN
DECLARE valor VARCHAR(60);
SELECT LENGTH(Curso.NombreSubCurso) INTO valor FROM Curso WHERE NombreSubCurso = inNombreSubCurso;
IF valor > 0 THEN
SET exist = TRUE;
ELSE
SET exist = FALSE;
END IF;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS `getCursoForId`;
DELIMITER $$
CREATE PROCEDURE `getCursoForId` (
  IN inidCurso INT
)
BEGIN
SELECT Curso.idCurso, Curso.NombreSubCurso, Curso.FechaInicio,
Curso.FechaFin, Curso.Curso_idCurso
FROM Curso 
WHERE idCurso = inidCurso;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS `updateCursoName`;
DELIMITER $$
CREATE PROCEDURE `updateCursoName` (
  IN inidCurso INT,
  IN inNombreSubCurso VARCHAR(60)
)
BEGIN
UPDATE Curso SET NombreSubCurso = inNombreSubCurso
WHERE idCurso = inidCurso;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS `returnIfNotExistOrNotModuloName`;
DELIMITER $$
CREATE PROCEDURE `returnIfNotExistOrNotModuloName` (
  IN inNombre VARCHAR(60),
  OUT exist BOOLEAN
)
BEGIN
DECLARE valor VARCHAR(60);
SELECT LENGTH(Modulo.Nombre) INTO valor FROM Modulo WHERE Nombre = inNombre;
IF valor > 0 THEN
SET exist = TRUE;
ELSE
SET exist = FALSE;
END IF;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS `getModuloForId`;
DELIMITER $$
CREATE PROCEDURE `getModuloForId` (
  IN inidModulo INT
)
BEGIN
SELECT Modulo.idModulo, Modulo.Nombre
FROM Modulo
WHERE Modulo.idModulo = inidModulo;
END $$
DELIMITER ;
/*
DROP PROCEDURE IF EXISTS `vacio`;
DELIMITER $$
CREATE PROCEDURE `vacio` (
  
)
BEGIN

END $$
DELIMITER ;
*/
-- -----------------------------------------------------
-- Function
-- -----------------------------------------------------
/*
DROP FUNCTION IF EXISTS `vacio`;
DELIMITER $$
CREATE FUNCTION `vacio` (
  
)
RETURNS BOOLEAN
BEGIN

END $$
DELIMITER ;
*/
-- -----------------------------------------------------
-- View
-- -----------------------------------------------------
DROP VIEW IF EXISTS `seeAllModuloCursoCarrera`;
CREATE VIEW `seeAllModuloCursoCarrera` AS
SELECT Carrera.NombreCurso, Curso.NombreSubCurso, Modulo.Nombre, Modulo.idModulo
FROM Carrera
INNER JOIN Curso
ON Carrera.idCarrera = Curso.Curso_idCurso
INNER JOIN Curso_has_Modulo
ON Curso.idCurso = Curso_has_Modulo.Curso_idCurso
INNER JOIN Modulo
ON Modulo.idModulo = Curso_has_Modulo.Modulo_idModulo
;

DROP VIEW IF EXISTS `seeAllUnidadModuloCursoCarrera`;
CREATE VIEW `seeAllUnidadModuloCursoCarrera` AS
SELECT Carrera.NombreCurso, Curso.NombreSubCurso, 
Modulo.Nombre, Unidad.idUnidad, Unidad.NombreUnidad
FROM Carrera
INNER JOIN Curso
ON Carrera.idCarrera = Curso.Curso_idCurso
INNER JOIN Curso_has_Modulo
ON Curso.idCurso = Curso_has_Modulo.Curso_idCurso
INNER JOIN Modulo
ON Modulo.idModulo = Curso_has_Modulo.Modulo_idModulo
INNER JOIN Unidad
ON Modulo.idModulo = Unidad.Modulo_idModulo
;

DROP VIEW IF EXISTS `seeAllTemaUnidadModuloCursoCarrera`;
CREATE VIEW `seeAllTemaUnidadModuloCursoCarrera` AS
SELECT Carrera.NombreCurso, Curso.NombreSubCurso, 
Modulo.Nombre, Unidad.NombreUnidad, Tema.idTema,
Tema.NombreTema
FROM Carrera
INNER JOIN Curso
ON Carrera.idCarrera = Curso.Curso_idCurso
INNER JOIN Curso_has_Modulo
ON Curso.idCurso = Curso_has_Modulo.Curso_idCurso
INNER JOIN Modulo
ON Modulo.idModulo = Curso_has_Modulo.Modulo_idModulo
INNER JOIN Unidad
ON Modulo.idModulo = Unidad.Modulo_idModulo
INNER JOIN  Tema
ON Unidad.idUnidad = Tema.Unidad_idUnidad
;

DROP VIEW IF EXISTS `seeAllUsers`;
CREATE VIEW `seeAllUsers` AS
SELECT Usuario.idUsuario AS nombre, Usuario.Persona_cedula AS identificacion, 
Usuario.Correo AS correo, Rol.NombreRol AS Rol,
CASE
  WHEN Usuario.EstadoUsuario != 0 THEN "Activo"
  ELSE "Inactivo"
END AS estado
FROM Usuario
INNER JOIN Rol
ON Rol.idRol = Usuario.Rol_idRol
;

DROP VIEW IF EXISTS `seeAllCarreraCurso`;
CREATE VIEW `seeAllCarreraCurso` AS
SELECT idCarrera ,NombreCurso, GROUP_CONCAT(idCurso, ':', NombreSubCurso separator '-') as respuestas
FROM Carrera 
INNER JOIN Curso 
ON Carrera.idCarrera = Curso.Curso_idCurso
GROUP BY Carrera.idCarrera
;

DROP VIEW IF EXISTS `seeAllCarrera`;
CREATE VIEW `seeAllCarrera` AS
SELECT idCarrera, NombreCurso, DescripcionCurso 
FROM Carrera
;

-- -----------------------------------------------------
-- Default data 
-- -----------------------------------------------------
INSERT INTO Identificacion VALUE (1,"cedula");
INSERT INTO Rol VALUE (1,"estudiante");
INSERT INTO Rol VALUE (2,"administrador");
INSERT INTO Rol VALUE (3,"docente");
INSERT INTO TipoMultimedia VALUE (1,"video");
INSERT INTO TipoMultimedia VALUE (2,"imagen");
INSERT INTO TipoMultimedia VALUE (3,"texto");
INSERT INTO TipoMultimedia VALUE (4,"audio");


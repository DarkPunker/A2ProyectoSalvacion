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
  `EstadoRol` TINYINT DEFAULT 1,
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
  UNIQUE INDEX `CarreraNombre_UNIQUE` (`NombreCurso` ASC) VISIBLE,
  PRIMARY KEY (`idCarrera`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Modulo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Modulo` (
  `idModulo` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
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
  `DireccionMultimedia` TEXT NOT NULL,
  `DireccionVideo` VARCHAR(255),
  `DireccionImagen` VARCHAR(255),
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
-- Procedure
-- -----------------------------------------------------
DROP PROCEDURE IF EXISTS `UsuarioPersonaTelefono`;
DELIMITER $$
CREATE PROCEDURE `UsuarioPersonaTelefono` (IN inidUsuario VARCHAR(45))
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
INSERT INTO Persona VALUE (inidPersona, NULL, innombre1, NULL, inapellido1, NULL, infechaNacimiento, insexo, NULL);
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

DROP PROCEDURE IF EXISTS `seeModuloUnidadTema`;
DELIMITER $$
CREATE PROCEDURE `seeModuloUnidadTema` (
  IN inidCurso INT
)
BEGIN
SELECT Curso_idCurso, idTema, NombreTema
FROM Tema
INNER JOIN Unidad
ON Unidad.idUnidad = Tema.Unidad_idUnidad
INNER JOIN Modulo
ON Modulo.idModulo = Unidad.Modulo_idModulo
INNER JOIN Curso_has_Modulo
ON Modulo.idModulo = Curso_has_Modulo.Modulo_idModulo
WHERE Curso_has_Modulo.Curso_idCurso = inidCurso;
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
INNER JOIN pregunta
ON Tema.idTema = pregunta.Tema_idTema
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
INNER JOIN pregunta
ON Tema.idTema = pregunta.Tema_idTema
INNER JOIN opcion
ON pregunta.idPregunta = opcion.Pregunta_idPregunta
WHERE Curso_has_Modulo.Curso_idCurso = inidCurso
GROUP BY pregunta.idPregunta;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS `ExamPreguntasOpciones`;
DELIMITER $$
CREATE PROCEDURE `ExamPreguntasOpciones` (
  IN inidExamen INT
)
BEGIN
SELECT idPregunta, Pregunta, Correcta, GROUP_CONCAT(idOpcion, ':', Enunciado separator '-') as respuestas
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
WHERE Examen.idExamen = inidExamen AND opcion.Correcta = 1;
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
SELECT Tema.idTema, Tema.NombreTema, COUNT(pregunta.idPregunta)AS Cantidad
FROM Curso_has_Modulo
INNER JOIN Modulo
ON Modulo.idModulo = Curso_has_Modulo.Modulo_idModulo
INNER JOIN Unidad
ON Modulo.idModulo = Unidad.Modulo_idModulo
INNER JOIN Tema
ON Unidad.idUnidad = Tema.Unidad_idUnidad
LEFT JOIN pregunta
ON Tema.idTema = pregunta.Tema_idTema
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
INNER JOIN pregunta
ON Tema.idTema = pregunta.Tema_idTema
INNER JOIN opcion
ON pregunta.idPregunta = opcion.Pregunta_idPregunta
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
FROM pregunta
INNER JOIN opcion
ON pregunta.idPregunta = opcion.Pregunta_idPregunta
WHERE pregunta.Tema_idTema = inidTema
GROUP BY pregunta.idPregunta;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS `seeTemaCountMultimedia`;
DELIMITER $$
CREATE PROCEDURE `seeTemaCountMultimedia` (
  IN inidCurso INT
)
BEGIN
SELECT Tema.idTema, Tema.NombreTema, COUNT(multimedia.idMultimedia)AS Cantidad
FROM Curso_has_Modulo
INNER JOIN Modulo
ON Modulo.idModulo = Curso_has_Modulo.Modulo_idModulo
INNER JOIN Unidad
ON Modulo.idModulo = Unidad.Modulo_idModulo
INNER JOIN Tema
ON Unidad.idUnidad = Tema.Unidad_idUnidad
LEFT JOIN multimedia
ON Tema.idTema = multimedia.Tema_idTema
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
SELECT Usuario.idUsuario AS nombre, Usuario.Rol_idRol AS rol, 
Usuario.Persona_cedula AS identificacion, Usuario.EstadoRol AS estado, 
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
SET Rol_idRol = inRol, EstadoRol = inestado 
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
SET NombreCurso = inNombreCurso, DescripcionCurso = inDescripcionCUrso 
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
WHERE UsuarioInscripcionCarrera_Usuario_idUsuario = inidUsuario;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS `getidCursoIsExam`;
DELIMITER $$
CREATE PROCEDURE `getidCursoIsExam` (
 IN inidExamen INT
)
BEGIN
SELECT Curso.Curso_idCurso 
FROM Curso_has_Examen 
INNER JOIN Curso 
ON Curso_has_Examen.Curso_idCUrso = Curso.idCurso 
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
FROM Curso 
WHERE Curso_idCurso = inidCarrera;
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
Usuario.Correo AS correo, Rol.NombreRol AS rol,
CASE
  WHEN Usuario.EstadoRol != 0 THEN "Activo"
  ELSE "Inactivo"
END AS estado
FROM Usuario
INNER JOIN Rol
ON Rol.idRol = Usuario.Rol_idRol
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


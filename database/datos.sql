-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: softwareeducativo
-- ------------------------------------------------------
-- Server version	8.0.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `Carrera`
--

/*!40000 ALTER TABLE `Carrera` DISABLE KEYS */;
INSERT INTO `Carrera` (`idCarrera`, `NombreCurso`, `DescripcionCurso`, `EstadoCarrera`) 
VALUES (1,'Derecho','Son un conjunto de normas y principios inspirados en la idea de orden y justicia, las cuales reglan las relaciones o comportamiento humano en la sociedad , la cual es impuesta de por parte de un poder público.',0);
/*!40000 ALTER TABLE `Carrera` ENABLE KEYS */;

--
-- Dumping data for table `Curso`
--

/*!40000 ALTER TABLE `Curso` DISABLE KEYS */;
INSERT INTO `Curso` (`idCurso`, `NombreSubCurso`, `FechaInicio`, `FechaFin`, `Curso_idCurso`) 
VALUES (1,'Constitucional Colombiano','0000-00-00 00:00:00',NULL,1),
(5,'Derechos Humanos','2020-02-10 00:00:00','2020-06-22',1),
(6,'Teoría Constitucional','2020-02-10 00:00:00','2020-06-22',1);
/*!40000 ALTER TABLE `Curso` ENABLE KEYS */;

--
-- Dumping data for table `Curso_has_Examen`
--

/*!40000 ALTER TABLE `Curso_has_Examen` DISABLE KEYS */;
INSERT INTO `Curso_has_Examen` (`Curso_idCurso`, `Examen_idExamen`, `Estado`) 
VALUES (1,10,1);
/*!40000 ALTER TABLE `Curso_has_Examen` ENABLE KEYS */;

--
-- Dumping data for table `Curso_has_Modulo`
--

/*!40000 ALTER TABLE `Curso_has_Modulo` DISABLE KEYS */;
INSERT INTO `Curso_has_Modulo` (`Curso_idCurso`, `Modulo_idModulo`, `Estado`) 
VALUES (1,1,1);
/*!40000 ALTER TABLE `Curso_has_Modulo` ENABLE KEYS */;

--
-- Dumping data for table `Examen`
--

/*!40000 ALTER TABLE `Examen` DISABLE KEYS */;
INSERT INTO `Examen` (`idExamen`, `NombreExamen`) 
VALUES (10,'Examen final');
/*!40000 ALTER TABLE `Examen` ENABLE KEYS */;

--
-- Dumping data for table `Examen_has_Pregunta`
--

/*!40000 ALTER TABLE `Examen_has_Pregunta` DISABLE KEYS */;
INSERT INTO `Examen_has_Pregunta` (`Examen_idExamen`, `Pregunta_idPregunta`) 
VALUES (10,1),(10,2),(10,3),(10,4),(10,5),(10,6),(10,7),(10,23),(10,24);
/*!40000 ALTER TABLE `Examen_has_Pregunta` ENABLE KEYS */;

--
-- Dumping data for table `identificacion`
--


--
-- Dumping data for table `Modulo`
--

/*!40000 ALTER TABLE `Modulo` DISABLE KEYS */;
INSERT INTO `Modulo` (`idModulo`, `Nombre`) 
VALUES (1,'Mecanismos de protección ciudadana');
/*!40000 ALTER TABLE `Modulo` ENABLE KEYS */;

--
-- Dumping data for table `Multimedia`
--

/*!40000 ALTER TABLE `Multimedia` DISABLE KEYS */;
INSERT INTO `Multimedia` (`idMultimedia`, `NombreMultimedia`, `DescripcionMultimedia`, `Direccion`, `EstadoMultimedia`, `Tema_idTema`, `TipoMultimedia_idTipoMultimedia`) 
VALUES (1,'Acción de tutela ','Procede para la protección inmediata de derechos constitucionales fundamentales cuando éstos resulten vulnerados o amenazados ya sea por autoridad pública o particular. No procede cuando existan otros medios de defensa judicial, salvo que se utilice como mecanismo transitorio para evitar un perjuicio irremediable.',NULL,1,111,3),
(2,'¿Que es la Acción de Tutela? ','Uniandes - Sesión Curso Constitución y Democracia: Acción de tutela y acciones populares LA ACCIÓN DE TUTELA CONTRA PROVIDENCIAS JUDICIALES Manuel Fernando Quinche Ramírez Constitucional... Cómo hacer una acción de tutela La acción de tutela en Colombia - Actualidad. Como Instaurar un Derecho de Peticion Y/o una Accion de Tutela- Hogar Tv por Juan Gonzalo Angel Tutela - Documental acción de tutela y derecho a la salud 1 Acción de tutela en Colombia reCurso de amparo en otros países constitución Política de Colombia Acción de tutela- Tatiana Zapata Acción de Tutela en Colombia acción de tutela Colombia - así funciona LA ACCIÓN DE TUTELA Accion de tutela\r\n','https://www.youtube.com/embed/V7aeWelZ9p8',1,112,1),
(3,'Acción de tutela ','Complemento Acción de tutela, menciona todos los derechos que defiende','https://www.youtube.com/embed/3yzo2MV4DXA',1,113,1),
(4,'¿Qué es la acción de tutela?','Es un proceso ágil y preferente que surge de una demanda, es decir una solicitud, una petición que puede hacer cualquier persona cuando ve vulnerados o amenazados sus derechos fundamentales, y cuando no existan otros reCursos o medios de defensa judiciales, salvo que aquella se utilice como mecanismo transitorio para evitar un perjuicio irremediable.',NULL,1,114,3),
(5,'¿Qué puede pedir?','La protección efectiva de los derechos fundamentales que considere vulnerados o amenazados. Lo primero que debe saber es que estos le pertenecen por el simple hecho de ser persona, y que son reconocidos como tales, no son taxativos (no se encuentran implícitos en norma alguna), sino que puede ser cualquier derivado de la condición humana. Estos derechos se encuentran mencionados en el capítulo primero de la Constitución Política.',NULL,1,115,3),
(6,'¿Contra quién procede?','Procede contra autoridades públicas de cualquier orden territorial o por servicios, y también contra particulares encargados de la prestación de un servicio público o cuya conducta afecte grave y directamente el interés colectivo, o respecto de quienes el solicitante se halle en estado de subordinación o indefenso.',NULL,1,116,3),
(7,'¿A quién debe dirigir la tutela?','Se dirige a los jueces o tribunales de cualquier jurisdicción, es decir puede ser laboral, civil, administrativa o penal, pues independientemente del Tema de su petición, ellos actúan para este caso como jueces constitucionales, dándole prioridad frente al resto de procesos judiciales de los que estén conociendo. Sin embargo, si bien no importa el área de conocimiento o jurisdicción del juez para que conozca de una determinada tutela, la competencia sí depende de la calidad del demandado. \r\n',NULL,1,117,3),
(8,'¿En qué consiste la protección de  la tutela?','Consiste en una orden para que aquel demandado actúe o se abstenga de hacerlo. El fallo, que será de inmediato cumplimiento, podrá impugnarse ante el juez que conoció la primera instancia dentro de los tres días siguientes a su notificación, y en todo caso, éste lo remitirá a la Corte Constitucional para su eventual revisión. \r\n',NULL,1,118,3),
(9,'Tiempo en el que debe tener respuesta de  la tutela','En ningún caso podrán transcurrir más de diez días entre la solicitud de tutela y su resolución. \r\n',NULL,1,119,3),
(10,'¿Qué debe contener la solicitud o demanda ?','1. Nombre, documento de identificación de quien ve amenazados o vulnerados sus derechos fundamentales.\r\n2. El nombre contra quien se dirige, es decir el demandado.\r\n3. Dirección quien presenta la tutela, teléfono y e-mail si lo tiene.\r\n4. El derecho amenazado o vulnerado.\r\n5. Los hechos claros que la motivan.\r\n6. Las órdenes que usted considera necesarias para proteger sus derechos. Por ejemplo, ordenar a la E.P.S. que le dé el tratamiento integral al paciente.\r\n7. La manifestación bajo juramento que no ha presentado otra tutela por los mismos hechos y derechos.\r\n8. Anexar pruebas que tenga en su poder o pedirle al juez que las solicite a la parte accionada.\r\n9. Si no da espera a la decisión, se puede pedir una medida preventiva para que se resuelva tan pronto se reciba la acción de tutela.\r\n',NULL,1,1110,3),
(11,'¿Dónde radicarla  la tutela?','Puede radicarlo en cualquier sede judicial.\r\n',NULL,1,1111,3),
(94,'Hábeas Data ¿Qué es?','Protección de datos personales\r\nMás información en: www.sic.gov.co','https://www.youtube.com/embed/Fo7h8IhWgBk',1,94,1),
(95,'¿Qué es el Habeas Data en Colombia?','De acuerdo con el superintendente delegado para la Protección de Datos Personales, José Alejandro Bermúdez, El Habeas Data es el derecho que tienen todas las personas a conocer, actualizar y rectificar las informaciones que se hayan recogido sobre ellas en bancos de datos y en archivos de entidades públicas y privadas.',NULL,1,95,3),
(96,'¿Cuando procede el habeas data?','Procede contra el hecho u omisión por parte de cualquier autoridad, funcionario o persona que vulnera o amenaza los siguientes derechos:\r\nA solicitar la información que requiera o a recibirla de cualquier entidad pública, salvo aquella que afecte la intimidad personal o que tiene que ver con la seguridad nacional.\r\nA que los servicios informáticos computarizados o no, públicos o privados, no den información que afecte la intimidad personal y familiar.',NULL,1,96,3),
(97,'¿Ante quien se presenta la demanda de habeas data?','Ante los Jueces de Primera Instancia en lo Civil del lugar donde ocurrieron los hechos o del domicilio del autor de tales hechos.',NULL,1,97,3),
(99,'¿Cuándo se puede aplicar el habeas data?','Como habeas data se denomina el derecho que tiene toda persona de conocer, corregir o actualizar toda aquella información que se relacione con ella y que se encuentre almacenada en centrales de información o bases de datos de organismos tanto públicos como privados.',NULL,1,99,3),
(100,'¿Qué derecho protege el Habeas Data en Colombia?','El Habeas Data es un mecanismo constitucional del cual toda persona puede hacer uso, con el fin de proteger la seguridad y veracidad de sus datos e información personal aportados en entidades financieras y de telecomunicaciones entre otras, que por su naturaleza recopilan datos de sus clientes y Usuarios',NULL,1,100,3),
(101,'¿Qué dice la Ley Habeas Data?','Habeas Data: ¿Qué es? Corresponde al derecho fundamental que tiene toda persona para conocer, actualizar y rectificar toda aquella información que se relacione con ella y que se recopile o almacene en centrales de información.',NULL,1,101,3),
(102,'¿Quién puede solicitar el habeas data?','Procede contra el hecho u omisión por parte de cualquier autoridad, funcionario o persona que vulnera o amenaza los siguientes derechos: A solicitar la información que requiera o a recibirla de cualquier entidad pública, salvo aquella que afecte la intimidad personal o que tiene que ver con la seguridad nacional.',NULL,1,102,3),
(103,'¿Por qué es importante el habeas data?','El Habeas Data es considerado un derecho constitucional que tiene por objeto la protección integral de los datos personales anotados en registros, archivos, bancos de datos, y en su defecto otros medios de protección de datos sean éstos públicos, o privados destinados a dar información',NULL,1,103,3),
(104,'¿Cuál es el objetivo del habeas data?','Se destaca que el Habeas data es un proceso constitucional con “fines diversos”, el cual apunta a “traer los datos” (así como el hábeas corpus procura “traer el cuerpo”) y su objetivo principal es contener ciertos excesos del llamado “poder informático”, protegiéndose el ámbito de libertad que solo incumbe a la persona',NULL,1,104,3),
(105,'¿Qué es el habeas data en sentido propio?','celar los datos inexactos o indebidamente procesados y disponer sobre su transmisión”. Frosini se refiere a ella como “una nueva forma presentada por el derecho a la libertad personal… es decir, el derecho a contRolar las informaciones sobre su propia persona, es el derecho al habeas data”.',NULL,1,105,3),
(106,'¿Cuáles son los derechos fundamentales que protege?','El reCurso de agravio constitucional denominado Hábeas Data, es una garantía que protege dos derechos fundamentales: el derecho a la información y la autodeterminación informativa o protección de datos personales; ambos, forman parte del ámbito de los derechos humanos, reconocidos y protegidos por los Tratados',NULL,1,106,3);
/*!40000 ALTER TABLE `Multimedia` ENABLE KEYS */;

--
-- Dumping data for table `Opcion`
--

/*!40000 ALTER TABLE `Opcion` DISABLE KEYS */;
-- INSERT INTO `Opcion` (`idOpcion`, `Enunciado`, `Correcta`, `Pregunta_idPregunta`) VALUES (1,'Los derechos fundamentales',1,1),(2,'El derecho al trabajo',0,1),(3,'El derecho a la vida',0,1),(4,'La igualdad de genero',0,1),(5,'La Protección de Datos Personales',1,2),(6,'La protección del buen nombre',0,2),(7,'Contra la estafa',0,2),(8,'Los datos de las redes sociales',0,2),(9,'Ninguna de las anteriores',0,2),(10,'10 días',1,3),(11,'15 días',0,3),(12,'20 días',0,3),(13,'25',0,3),(14,'30',0,3),(15,'En cualquier sede judicial',1,4),(16,'La policía ',0,4),(17,'El ejercito',0,4),(18,'Defensoria del pueblo ',0,4),(19,'Contra autoridades públicas de cualquier orden territorial',0,5),(20,'Contra autoridades públicas prestación servicios',0,5),(21,'Particulares encargados de la prestación de un servicio público',0,5),(22,'El solicitante se halle en estado de subordinación',0,5),(23,'El solicitante se halle en estado  indefenso',0,5),(24,'Todas las anteriores',1,5),(25,'Proteger la seguridad y veracidad de sus datos e información personal',0,6),(26,'Evita el uso no autorizado de los datos',0,6),(27,'Todas las anteriores',1,6),(28,'Toda persona para conocer, actualizar y rectificar toda aquella información que se relacione con ella y que se recopile o almacene en centrales de información.',1,7),(29,'Elimina los datos que no quiere que se muestren ',0,7),(30,'El capturado',0,8),(31,'Abogado',0,8),(32,'Otra persona',0,8),(33,'Todas las anteriores',1,8),(34,'El incumplimiento de una norma con fuerza de ley (leyes, decretos extraordinarios, decretos legislativos) .',1,9),(35,'Es cuando lo detienen sin  causa',0,9),(36,'Es cuando usan sus datos personales sin permiso',0,9),(37,'El tribunal tiene 20 días para decidir.',1,10),(38,'El tribunal tiene 10 días para decidir.',0,10),(39,'El tribunal tiene 5 días para decidir.',0,10),(40,'Se ve afectado por el incumplimiento de una ley o acto administrativo',1,11),(41,'cuando no respetan los derechos fundamentales',0,11),(42,'Cuando se vencieron los términos y no alcanzo hacer el proceso',0,11),(43,'Ante el juez administrativo del domicilio del accionante. ',1,12),(44,'Ante la policía',0,12),(45,'La defensoria del pueblo',0,12),(46,'Ante cualquier  magistrado',0,12),(47,'Ante cualquier juez  ',0,12),(48,'Todas las anteriores',0,12),(49,'Ninguna de las anteriores',0,12),(50,'Máximo 36 horas',1,14),(51,'Máximo 36 días',0,14),(52,'Máximo 15 horas',0,14),(53,'Máximo 15 días',0,14),(54,'Demostrada la violación de las garantías constitucionales o legales, el juez inmediatamente ordenará la libertad ',1,15),(55,'Demostrada la violación de las garantías constitucionales o legales, el juez lo retiene 2 días más',0,15),(56,'Demostrada la violación de las garantías constitucionales o legales, el juez lo retiene 1 días más',0,15),(57,'La acción de grupo es una figura jurídica que sirve para posibilitar la indemnización de perjuicios causados a un número plural de personas',1,16),(58,'La acción de grupo es una figura jurídica que sirve para posibilitar la indemnización de perjuicios causados a un número singular de personas',0,16),(59,'La acción de grupo es una figura jurídica que sirve para posibilitar la indemnización de perjuicios causados a 2 personas',0,16),(60,'Esta acción tiene como finalidad exclusiva el reconocimiento y pago de la indemnización de los perjuicios originados tanto por la vulneración de derechos colectivos',1,17),(61,'Esta acción tiene como finalidad   la indemnización a una persona',0,17),(62,'Esta acción tiene como finalidad   la indemnización a una familia',0,17),(63,'Todos aquellos derechos relacionados con ambiente sano, moralidad administrativa, espacio público, patrimonio cultural, seguridad y salubridad pública, servicios públicos, consumidores y Usuarios, libre competencia económica',1,18),(64,'Todos aquellos derechos relacionados con ambiente sano, moralidad administrativa, espacio público, patrimonio cultural, seguridad y salubridad pública, servicios públicos, consumidores y Usuarios, libre competencia económica en un apartamento',0,18),(65,'Todos aquellos derechos relacionados con ambiente sano, moralidad administrativa, espacio público, patrimonio cultural, seguridad y salubridad pública, servicios públicos, consumidores y Usuarios, libre competencia económica casa residencial ',0,18),(66,'Caracteriza por ser indemnizatoria',0,19),(67,'El número plural de personas debe ser mínimo de 20 para que sea procedente',0,19),(68,'Deberá presentarse dentro de los dos años siguientes a la fecha en que se causó el daño',0,19),(69,'Puede ser presentada tanto porpersonas naturales como jurídicas',0,19),(70,'Deberán ser presentadas ante el juez contencioso administrativo cuando el perjuicio haya sido causado por una entidad pública',0,19),(71,'Deberán ser presentadas ante el juez contencioso administrativo cuando el perjuicio haya sido causado   por una entidad privada que desempeñe funciones administrativas',0,19),(72,'Todas las anteriores',1,19),(73,'Una petición es la solicitud verbal o escrita que se presenta en forma respetuosa ante un servidor público',1,20),(74,'Una petición es la solicitud verbal o escrita que se presenta en forma respetuosa ante una empresa privada',0,20),(75,'Una petición es la solicitud verbal o escrita que se presenta en forma respetuosa ante una persona natural',0,20),(76,'Todo ser humano independientemente de las condiciones de sexo, edad, nacionalidad, estado civil',1,21),(77,'Cualquier Colombiano',0,21),(78,'Cualquier persona mayor de 30 años',0,21),(79,'Cualquier hombre casado',0,21),(80,'Las autoridades',0,22),(81,'Los particulares que presten un servicio público o actúen o deban actuar en desarRollo de funciones públicas',0,22),(82,'El legislador podrá reglamentar el ejercicio del derecho de petición ante las organizaciones privadas para garantizar los derechos fundamentales',0,22),(83,'Todas las anteriores',1,22),(84,'Sí. El derecho de acceso a documentos públicos puede ampararse bajo reserva en los casos que establezca la Ley',0,23),(85,'Los funcionarios públicos están autorizados para no permitir el acceso a aquellos documentos que sean reservados.',0,23),(86,'El carácter reservado de un documento no será oponible a las autoridades que lo soliciten en el debido ejercicio de sus funciones',0,23),(87,'Les corresponde a dichas autoridades asegurar su reserva.',0,23),(88,'Todas las anteriores',1,23),(89,'Quince (15) días para contestar quejas, reclamos y manifestaciones',0,24),(90,'Diez (10) días para contestar peticiones de información',0,24),(91,'Treinta (30) días para contestar consultas',0,24),(92,'Todas las anteriores',1,24);
/*!40000 ALTER TABLE `Opcion` ENABLE KEYS */;

--
-- Dumping data for table `persona`
--



--
-- Dumping data for table `Pregunta`
--

/*!40000 ALTER TABLE `Pregunta` DISABLE KEYS */;
-- INSERT INTO `Pregunta` (`idPregunta`, `Pregunta`, `Tema_idTema`) VALUES (1,'¿Qué defiende la acción de tutela?',1),(2,'¿Qué defiende Habeas data?',2),(3,'Tiempo en el que debe tener respuesta la acción de tutela',1),(4,' ¿Dónde radicarla la acción de tutela?',1),(5,'¿Contra quién procede la acción de tutela?',1),(6,'¿Qué derecho protege el Habeas Data en Colombia?',2),(7,'¿Qué dice la Ley Habeas Data?',2),(8,'¿Quién puede interponerlo habeas corpus?',3),(9,'¿Qué es una acción de cumplimiento?',4),(10,'¿Cuántos días hábiles se tiene para responder la acción de cumplimiento?',4),(11,'¿Cuándo se solicita la  acción de cumplimiento?',4),(12,'¿Ante quién se interpone acción de cumplimiento?',4),(13,'¿Ante quién se interpone habeas corpus?',3),(14,'¿Termino para resolver el habeas corpus?',3),(15,'¿Cómo es la decisión del habeas corpus?',3),(16,'¿Qué es la acción de grupo?',5),(17,'¿Cuáles es la finalidad de las acciones de grupo?',5),(18,'¿Qué tipo de derechos protege las acciones de grupo?',5),(19,'¿Cuáles son las principales características de acción de grupo?',5),(20,'¿Qué es una petición?',7),(21,'¿Quiénes tienen derecho a presentar peticiones?',7),(22,'¿Ante quién se puede ejercer el derecho de petición?',7),(23,'¿Hay límites al acceso de documentos públicos cuando se hace una petición?',7),(24,'¿Tiempo para dar respuesta a las peticiones?',7);
/*!40000 ALTER TABLE `Pregunta` ENABLE KEYS */;

--
-- Dumping data for table `Rol`
--

/*!40000 ALTER TABLE `Rol` DISABLE KEYS */;
INSERT INTO `Rol` (`idRol`, `NombreRol`) VALUES (1,'estudiante'),(2,'administrador'),(3,'docente');
/*!40000 ALTER TABLE `Rol` ENABLE KEYS */;

--
-- Dumping data for table `sessions`
--


--
-- Dumping data for table `Tema`
--

/*!40000 ALTER TABLE `Tema` DISABLE KEYS */;
INSERT INTO `Tema` (`idTema`, `NombreTema`, `Unidad_idUnidad`) VALUES (111,'Introduccion a Acción de tutela',1),(112,'¿Que es la Acción de Tutela? ',1),(113,'Complemento Acción de tutela',1),(114,'Otro concepto de acción de tutela',1),(115,'¿Qué puede pedir?',1),(116,'¿Contra quién procede?',1),(117,'¿A quién debe dirigir la tutela?',1),(118,'¿En qué consiste la protección de  la tutela?',1),(119,'Tiempo en el que debe tener respuesta de  la tutela',1),(1110,'¿Qué debe contener la solicitud o demanda ?',1),(1111,'¿Dónde radicarla  la tutela?',1),(94,'Hábeas Data ¿Qué es?',2),(95,'¿Qué es el Habeas Data en Colombia?',2),(96,'¿Cuando procede el habeas data?',2),(97,'¿Ante quien se presenta la demanda de habeas data?',2),(99,'¿Cuándo se puede aplicar el habeas data?',2),(100,'¿Qué derecho protege el Habeas Data en Colombia?',2),(101,'¿Qué dice la Ley Habeas Data?',2),(102,'¿Quién puede solicitar el habeas data?',2),(103,'¿Por qué es importante el habeas data?',2),(104,'¿Cuál es el objetivo del habeas data?',2),(105,'¿Qué es el habeas data en sentido propio?',2),(106,'¿Cuáles son los derechos fundamentales que protege?',2);
/*!40000 ALTER TABLE `Tema` ENABLE KEYS */;

--
-- Dumping data for table `tipoMultimedia`
--


/*!40000 ALTER TABLE `Unidad` DISABLE KEYS */;
INSERT INTO `Unidad` (`idUnidad`, `NombreUnidad`, `Modulo_idModulo`) VALUES (1,'Acción de Tutela',1),(2,'Habeas Data',1),(3,'Habeas Corpus',1),(4,'Acción de Cumplimiento',1),(5,'Acción de Grupo',1),(6,'Derecho de Petición',1),(7,'Acción Popular',1);
/*!40000 ALTER TABLE `Unidad` ENABLE KEYS */;

--
-- Dumping data for table `Usuario`
--


--
-- Dumping data for table `UsuarioinscripcionCarrera`
--

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-02-18 10:04:15

/* DELETE FROM UsuarioPresentaExamen;
DELETE FROM UsuarioVeTema;
DELETE FROM UsuarioInscripcionCarrera;
DELETE FROM Curso_has_Examen;
DELETE FROM Examen_has_Pregunta;
DELETE FROM Examen;
DELETE FROM Opcion;
DELETE FROM Pregunta;
DELETE FROM Multimedia;
DELETE FROM Tema;
DELETE FROM Unidad;
DELETE FROM Curso_has_Modulo;
DELETE FROM Modulo;
DELETE FROM Curso;
DELETE FROM Carrera; */
/* SELECT * FROM UsuarioPresentaExamen;
SELECT * FROM UsuarioVeTema;
SELECT * FROM UsuarioInscripcionCarrera;
SELECT * FROM Curso_has_Examen;
SELECT * FROM Examen_has_Pregunta;
SELECT * FROM Examen;
SELECT * FROM Opcion;
SELECT * FROM Pregunta;
SELECT * FROM Multimedia;
SELECT * FROM Tema;
SELECT * FROM Unidad;
SELECT * FROM Curso_has_Modulo;
SELECT * FROM Modulo;
SELECT * FROM Curso;
SELECT * FROM Carrera; */
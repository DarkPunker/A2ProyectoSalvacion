INSERT INTO `Carrera` (`idCarrera`, `NombreCurso`, `DescripcionCurso`) VALUES (1,'Derecho','Son un conjunto de normas y principios inspirados en la idea de orden y justicia, las cuales reglan las relaciones o comportamiento humano en la sociedad , la cual es impuesta de por parte de un poder público.');


INSERT INTO `Curso` (`idCurso`, `NombreSubCurso`, `FechaInicio`, `FechaFin`, `Curso_idCurso`) VALUES (1,'Constitucional Colombiano',NULL,NULL,1),(5,'Derechos Humanos','2020-02-10','2020-06-22',1),(6,'Teoría Constitucional','2020-02-10','2020-06-22',1);

INSERT INTO `Curso_has_Modulo` (`Curso_idCurso`, `Modulo_idModulo`, `Estado`) VALUES (1,1,1);

INSERT INTO `Multimedia` (`idMultimedia`, `NombreMultimedia`, `DireccionMultimedia`, `DireccionVideo`, `DireccionImagen`, `EstadoMultimedia`, `Tema_idTema`, `TipoMultimedia_idTipoMultimedia`) VALUES (1,'Acción de tutela ','Procede para la protección inmediata de derechos constitucionales fundamentales cuando éstos resulten vulnerados o amenazados ya sea por autoridad pública o particular. No procede cuando existan otros medios de defensa judicial, salvo que se utilice como mecanismo transitorio para evitar un perjuicio irremediable.',NULL,NULL,1,1,3),(2,'¿Que es la Acción de Tutela? ','Uniandes - Sesión Curso Constitución y Democracia: Acción de tutela y acciones populares LA ACCIÓN DE TUTELA CONTRA PROVIDENCIAS JUDICIALES Manuel Fernando Quinche Ramírez Constitucional... Cómo hacer una acción de tutela La acción de tutela en Colombia - Actualidad. Como Instaurar un Derecho de Peticion Y/o una Accion de Tutela- Hogar Tv por Juan Gonzalo Angel Tutela - Documental acción de tutela y derecho a la salud 1 Acción de tutela en Colombia recurso de amparo en otros países constitución Política de Colombia Acción de tutela- Tatiana Zapata Acción de Tutela en Colombia acción de tutela Colombia - así funciona LA ACCIÓN DE TUTELA Accion de tutela\r\n','https://www.youtube.com/embed/V7aeWelZ9p8',NULL,1,1,1),(3,'Acción de tutela ','Complemento Acción de tutela, menciona todos los derechos que defiende','https://www.youtube.com/embed/3yzo2MV4DXA',NULL,1,1,1),(4,'¿Qué es la acción de tutela?','Es un proceso ágil y preferente que surge de una demanda, es decir una solicitud, una petición que puede hacer cualquier persona cuando ve vulnerados o amenazados sus derechos fundamentales, y cuando no existan otros recursos o medios de defensa judiciales, salvo que aquella se utilice como mecanismo transitorio para evitar un perjuicio irremediable.',NULL,NULL,1,1,3),(5,'¿Qué puede pedir?','La protección efectiva de los derechos fundamentales que considere vulnerados o amenazados. Lo primero que debe saber es que estos le pertenecen por el simple hecho de ser persona, y que son reconocidos como tales, no son taxativos (no se encuentran implícitos en norma alguna), sino que puede ser cualquier derivado de la condición humana. Estos derechos se encuentran mencionados en el capítulo primero de la Constitución Política.',NULL,NULL,1,1,3),(6,'¿Contra quién procede?','Procede contra autoridades públicas de cualquier orden territorial o por servicios, y también contra particulares encargados de la prestación de un servicio público o cuya conducta afecte grave y directamente el interés colectivo, o respecto de quienes el solicitante se halle en estado de subordinación o indefenso.',NULL,NULL,1,1,3),(7,'¿A quién debe dirigir la tutela?','Se dirige a los jueces o tribunales de cualquier jurisdicción, es decir puede ser laboral, civil, administrativa o penal, pues independientemente del tema de su petición, ellos actúan para este caso como jueces constitucionales, dándole prioridad frente al resto de procesos judiciales de los que estén conociendo. Sin embargo, si bien no importa el área de conocimiento o jurisdicción del juez para que conozca de una determinada tutela, la competencia sí depende de la calidad del demandado. \r\n',NULL,NULL,1,1,3),(8,'¿En qué consiste la protección?','Consiste en una orden para que aquel demandado actúe o se abstenga de hacerlo. El fallo, que será de inmediato cumplimiento, podrá impugnarse ante el juez que conoció la primera instancia dentro de los tres días siguientes a su notificación, y en todo caso, éste lo remitirá a la Corte Constitucional para su eventual revisión. \r\n',NULL,NULL,1,1,3),(9,'Tiempo en el que debe tener respuesta','En ningún caso podrán transcurrir más de diez días entre la solicitud de tutela y su resolución. \r\n',NULL,NULL,1,1,3),(10,'¿Qué debe contener la solicitud o demanda?','1. Nombre, documento de identificación de quien ve amenazados o vulnerados sus derechos fundamentales.\r\n2. El nombre contra quien se dirige, es decir el demandado.\r\n3. Dirección quien presenta la tutela, teléfono y e-mail si lo tiene.\r\n4. El derecho amenazado o vulnerado.\r\n5. Los hechos claros que la motivan.\r\n6. Las órdenes que usted considera necesarias para proteger sus derechos. Por ejemplo, ordenar a la E.P.S. que le dé el tratamiento integral al paciente.\r\n7. La manifestación bajo juramento que no ha presentado otra tutela por los mismos hechos y derechos.\r\n8. Anexar pruebas que tenga en su poder o pedirle al juez que las solicite a la parte accionada.\r\n9. Si no da espera a la decisión, se puede pedir una medida preventiva para que se resuelva tan pronto se reciba la acción de tutela.\r\n',NULL,NULL,1,1,3),(11,'¿Dónde radicarla?','Puede radicarlo en cualquier sede judicial.\r\n',NULL,NULL,1,1,3),(45,'Acción de Cumplimiento','Es un mecanismo mediante el cual toda persona podrá acudir ante la autoridad judicial para hacer efectivo el cumplimiento de normas aplicables con fuerza material de ley o actos administrativos',NULL,NULL,1,4,3),(46,'Acción de cumplimiento - Ley 393 de 1997',' Diseño gráfico y animación: Jenny David/ Jefe de Producción: Lyda Contreras/ Departamento de Recursos y Apoyos Informáticos -DRAI-Facultad de Ingeniería - Universidad de Antioquia.','https://www.youtube.com/embed/mv56ZumW9pw',NULL,1,4,1),(47,'Acción de cumplimiento difiere de la Acción de tutela ','Este mecanismo es similar a la tutela, sin embargo la diferencia radica en que la acción de cumplimiento se utiliza para hacer efectivas las leyes y la tutela para proteger los derechos fundamentales de una persona.\r\n',NULL,NULL,1,4,3),(48,'¿Dónde se presenta?','La acción de cumplimiento la puede presentar cualquier persona ante los jueces y tribunales administrativos, así como las organizaciones sociales, no gubernamentales y los servidores públicos.\r\n',NULL,NULL,1,4,3),(49,'¿Cómo interponer una acción de cumplimiento?','De acuerdo con el Ministerio de Justicia y del Derecho, estos son los pasos que debe seguir un ciudadano antes de interponer una acción de cumplimiento:\r\n1. El ciudadano debe presentar un reclamo directo a la autoridad (o el particular) que haya incumplido su deber u obligación. Este reclamo debe realizarse por escrito para que sirva de soporte.\r\n2. Si la autoridad mantiene su incumplimiento dentro de los 10 días siguientes a la presentación del reclamo directo, el ciudadano podrá procede a presentar la demanda ante el juez o tribunal administrativo.\r\n',NULL,NULL,1,4,3),(50,'Contenido de la acción de cumplimiento','·         Nombre completo, identificación y domicilio del accionante.\r\n\r\n·         Determinación de la ley, norma con fuerza de ley o copia del acto administrativo incumplido.\r\n\r\n·         Narración de los hechos constitutivos de incumplimiento.\r\n\r\n·         Determinación de la autoridad o particular incumplido (cuando este actué o deba actuar en ejercicio de funciones públicas).\r\n\r\n·         Prueba de la renuencia a aceptar la petición de cumplimiento.\r\n\r\n·         Solicitud y aporte pruebas.\r\n\r\n·         Manifestación que se entiende prestada bajo juramento de no haber presentado otra solicitud respecto de los mismos hechos o derechos ante ninguna otra autoridad.\r\n\r\n·         Direcciones para notificaciones, del accionante y de la autoridad incumplida.',NULL,NULL,1,4,3),(51,'¿Necesita abogado?','No, usted puede ejercitarla directamente.',NULL,NULL,1,4,3),(52,'¿Cuándo se solicita?','Solo se puede intentar cuando no exista otro medio de defensa judicial.\r\n\r\n \r\n\r\nSi usted se ve afectado por el incumplimiento de una ley o acto administrativo, reclame a la autoridad encargada  de su cumplimiento, si ella se ratifica en su incumplimiento o no contesta dentro de los 10 días siguientes, puede interponer acción verbal (sino sabe leer, ni escribir, es menor de edad o se encuentra en situación de extrema urgencia) o por escrito ante el tribunal contencioso administrativo de su domicilio para hacer efectivo el cumplimiento de la norma.',NULL,NULL,1,4,3),(53,'Ante quién se interpone','Ante el juez administrativo del domicilio del accionante. Mientras entran en funcionamiento los Jueces administrativos se adelanta ante el tribunal contencioso administrativo del departamento.',NULL,NULL,1,4,3),(54,'Término para decidir','El tribunal tiene 20 días para decidir, después de la admisión de la solicitud.',NULL,NULL,1,4,3),(55,'Término para cumplir la decisión','La autoridad o el particular tendrán 10 días para cumplir lo resuelto, a menos que el tribunal de un plazo mayor.',NULL,NULL,1,4,3),(56,'Formato Acción de Cumplimiento','',NULL,NULL,1,4,2),(57,'¿Qué es el habeas corpus?','¿Qué es el habeas corpus? Es una acción pública que protege la libertad personal cuando alguien es capturado con violación de las garantías constitucionales o legales, o se prolongue ilegalmente la privación de su libertad.\r \r  \r \r Es el derecho fundamental de toda persona que se considere ilegalmente privada de su libertad a reclamar de la autoridad judicial la protección de su derecho a mantenerse libre.\r \r  \r \r El derecho de Habeas Corpus está reconocido en el artículo 30 de la carta Política.\r \r  \r \r La acción del Habeas Corpus, es aquella acción pública que tiene por objeto la protección de la libertad personal de quien se encuentre capturado con violación de las garantías constitucionales o legales, o sea sometido a una prolongación ilegal de la privación de su libertad.\r \r  \r \r La acción del Habeas Corpus se interpone ante cualquier funcionario judicial, sin embargo, el tramite corresponde exclusivamente al juez del lugar donde se cercano a éste.  El Juez que no tramite o decida dentro del término  legal una petición de Habeas Corpus u obstaculice su tramitación, será sancionado con arresto o privación de la libertad y con la pérdida del empleo.\r \r  \r \r Las consecuencia que produce el otorgamiento del Habeas Corpus, se sustraen en que la persona afectada recupera su libertad, donde no podrá ser objeto de nuevas medidas restrictivas de la libertad cuyo fin sea impedir el restablecimiento de las garantías quebrantadas.\r \r  \r \r Las personas responsables de la violación del derecho a la libertad deben ser investigadas disciplinaria y penalmente',NULL,NULL,1,3,3),(58,'¿Quién puede interponerlo?','El capturado, su abogado u otra persona.',NULL,NULL,1,3,3),(59,'¿Qué debe contener el escrito de habeas corpus?','·         Fecha\r\n\r\n·         Funcionario judicial al que se dirige.\r\n\r\n·         Nombre completo de la persona privada de la libertad.\r\n\r\n·         Motivos por los que se considera la privación de la libertad como violatoria de la Constitución o la ley.\r\n\r\n·         Fecha de reclusión y lugar donde se encuentra capturado.\r\n\r\n·         Si es posible la identificación del funcionario que ordeno la captura y cargo que desempeña.\r\n\r\nAdemás bajo la gravedad del juramento que se considera prestado por la presentación de la petición deberá afirmarse que ningún otro juez ha asumido el conocimiento de la solicitud de habeas corpus o decidido sobre la misma.',NULL,NULL,1,3,3),(60,'¿Ante quién se interpone?','Ante cualquier juez o magistrado sin ser sometido a reparto, la decisión corresponde exclusivamente al juez penal.',NULL,NULL,1,3,3),(61,'¿Termino para resolver el habeas corpus?   ','Máximo 36 horas.\r\n\r\nPuede invocarse ante cualquier autoridad judicial competente.\r\n\r\nDebe ser resuelto en un término de 36 horas.\r\n\r\nNo se suspenderá, incluso en Estados de Excepción\r\n\r\nEn tres meses las solicitudes deben ser atendidas 24 horas al día, en días feriados y en épocas de vacancia judicial.',NULL,NULL,1,3,3),(62,'¿Cómo es la decisión del habeas corpus?','Demostrada la violación de las garantías constitucionales o legales, el juez inmediatamente ordenará la libertad de la persona capturada, por auto contra el cual no procede recurso alguno. Si se niega la decisión la decisión podrá ser impugnada.\r\n\r\n \r\n\r\nEn ningún caso el trámite y la decisión sobre el habeas corpus pueden exceder de treinta y seis (36) horas.',NULL,NULL,1,3,3),(63,'Derechos de la persona capturada','·         Ser informada de las razones de su detención.\r\n\r\n·         Ser puesta a disposición del fiscal competente.\r\n\r\n·         Hablar con un abogado.\r\n\r\n·         Comunicar a sus familiares o amigos acerca de su situación.\r\n\r\n·         Interponer el recurso de habeas corpus.\r\n\r\n·         No ser incomunicado.',NULL,NULL,1,3,3),(64,'Formato de Habeas Corpus','',NULL,'',1,3,2),(65,'Habeas Corpus en Colombia','Ley 1095 de 2006','https://www.youtube.com/embed/yE4fSsKENYY',NULL,1,3,1),(66,'¿Qué es el Derecho de Petición?','El derecho de petición es la facultad que toda persona tiene para presentar solicitudes ante las autoridades o ante ciertos particulares y obtener de ellos una pronta solución sobre lo solicitado.\r\nEs un derecho fundamental, consagrado en el Artículo 23 de la Constitución Nacional y es un deber de obligatorio cumplimiento para la administración pública. El Derecho de Petición puede ejercerse en interés, general o particular u obrando en cumplimiento de una obligación o deber legal. También, puede tratarse del Derecho de Petición de Informaciones y del Derecho de Formulación de Consultas.',NULL,NULL,1,6,3),(67,'Derecho de petición','','https://www.youtube.com/embed/wLywyvb1sj4',NULL,1,6,1),(68,'¿Qué es una petición?','Una petición es la solicitud verbal o escrita que se presenta en forma respetuosa ante un servidor público o ante ciertos particulares con el fin de requerir su intervención en su asunto concreto.',NULL,NULL,1,6,3),(69,'¿Quiénes tienen derecho a presentar peticiones?','Cualquier persona lo puede presentar: todo ser humano independientemente de las condiciones de sexo, edad, nacionalidad, estado civil, etc.\r\n\r\n \r\n\r\nEn Colombia tienen derecho a presentar peticiones todas las personas, sean nacionales o extranjeras, adultas o menores de edad, letradas o analfabetas.\r\n\r\n \r\n\r\nSin embargo, a los militares y policias está prohibido constitucionalmente formular como tales, ante las autoridades de la fuerza pública, peticiones que no se relacionen con el servicio y la moralidad del cuerpo respectivo. Lo anterior no impide a militares y policías ejercer libremente el derecho de petición en otros ámbitos y materias, pues todos ellos son titulares de ese derecho fundamental.',NULL,NULL,1,6,3),(70,'¿Ante quién se puede ejercer el derecho de petición?','El derecho de petición se puede ejercer ante:\r\n\r\n·         Las autoridades\r\n\r\n·         Los particulares que presten un servicio público o actúen o deban actuar en desarrollo de funciones públicas.\r\n\r\n·         El legislador podrá reglamentar el ejercicio del derecho de petición ante las organizaciones privadas para garantizar los derechos fundamentales.',NULL,NULL,1,6,3),(72,'¿Hay límites al acceso de documentos públicos?','Sí. El derecho de acceso a documentos públicos puede ampararse bajo reserva en los casos que establezca la Ley. Los funcionarios públicos están autorizados para no permitir el acceso a aquellos documentos que sean reservados.\r\n\r\n \r\n\r\nEl carácter reservado de un documento no será oponible a las autoridades que lo soliciten en el debido ejercicio de sus funciones; sin embargo, les corresponde a dichas autoridades asegurar su reserva.',NULL,NULL,1,6,3),(73,'¿Que finalidad pueden presentarse las peticiones?','Las peticiones pueden presentarse:* Para que por motivos de interés general o particular se inicie por las autoridades una actuación administrativa.\r\n*  Para que por motivos de interés general o particular las autoridades permitan el acceso a la información sobre las acciones por ellas desarrolladas.\r\n*  Para que por motivos de interés general o particular las autoridades permitan conocer documentos no reservados u obtener copias de los mismos.\r\n* Para que por motivos de interés general o particular se den por las autoridades dictámenes o conceptos sobre asuntos de su competencia.',NULL,NULL,1,6,3),(74,'¿Qué deben contener las peticiones?','Las peticiones escritas deberán contener, por lo menos:\r\n·         La designación de la autoridad a la que se dirige.\r\n·         Los nombres y apellidos completos del solicitante y de su representante o apoderado, si es el caso, con indicación de los documentos de identidad y sus direcciones.\r\n·         El objeto de la petición.\r\n·         Las razones en que se apoya.\r\n·         La relación de documentos que se acompañan.\r\n·         La firma del peticionario, cuando fuere el caso.',NULL,NULL,1,6,3),(75,'¿Pueden exigir requisitos para dar trámite a peticiones?','Sí. Conforme a la ley, las autoridades pueden exigir algunos requisitos especiales como por ejemplo que ciertas peticiones se presenten por escrito, que se acrediten algunos requisitos para iniciar o adelantar actuaciones administrativas, en cuyo caso la relación de todos estos deberá fijarse en un lugar de la entidad, visible al público, etc.\r\nSin embargo, la Constitución Política establece que cuando un derecho o una actividad hayan sido reglamentados de manera general, las autoridades públicas no podrán establecer ni exigir permisos, licencias o requisitos adicionales para su servicio.\r\nLas constancias, certificaciones o documentos que los servidores o autoridades tengan, o que puedan conseguir, en los archivos de la respectiva entidad, no serán exigidos a los particulares.',NULL,NULL,1,6,3),(76,'¿Qué nombres reciben los diferentes tipos de peticiones?','Las peticiones se denominan:\r\n\r\nQUEJAS, cuando ponen en conocimiento de las autoridades conductas irregulares de empleados oficiales o particulares a quienes se ha atribuido o adjudicado la prestación de un servicio público.\r\n\r\nRECLAMOS, cuando se da a las autoridades noticia de la suspensión injustificada o de la prestación deficiente de un servicio público.\r\n\r\nMANIFESTACIONES, cuando hacen llegar a las autoridades la opinión del peticionario sobre una materia sometida a actuación administrativa.\r\n\r\nPETICIONES DE INFORMACIÓN, cuando se formulan a las autoridades para que estas: Den a conocer cómo han actuado en un caso concreto; Permitan el acceso a los documentos públicos que tienen en su poder; Expidan copia de documentos que reposan en una oficina pública.\r\n\r\nCONSULTAS, cuando se presentan a las autoridades para que manifiesten su parecer sobre materias relacionadas con sus atribuciones.',NULL,NULL,1,6,3),(77,'¿Tiempo para dar respuesta a las peticiones?','Por regla general:\r\n·         Quince (15) días para contestar quejas, reclamos y manifestaciones.\r\n·         Diez (10) días para contestar peticiones de información.\r\n·         Treinta (30) días para contestar consultas.',NULL,NULL,1,6,3),(78,'¿Se puede desistir de las peticiones?','Sí. El solicitante puede desistir de las peticiones: en forma expresa, cuando el peticionario así lo manifieste y en forma tácita cuando, conforme a la ley, opere la presunción de desistimiento.\r\nNo obstante lo anterior, las autoridades de oficio podrán continuar con la actuación, si la consideran necesaria para el interés público.',NULL,NULL,1,6,3),(79,'¿Se vulnera el derecho  con  silencio administrativo?','Sí. De acuerdo con la jurisprudencia de la Corte Constitucional, la falta de resolución o la resolución tardía son formas de violación del derecho de petición, no obstante las consecuencias jurídicas del silencio administrativo.',NULL,NULL,1,6,3),(80,'¿Qué consecuencias trae injustificado ?','Ese retardo injustificado es motivo de sanción disciplinaria, pues incurren en causal de mala conducta los servidores públicos que sin razones válidas incumplen los términos para resolver o contestar una petición.',NULL,NULL,1,6,3),(81,'¿Qué pueden a quien vulnerado su derecho?','Cuando, por acción u omisión de las autoridades o de los particulares que presten un servicio público o actúen o deban actuar en desarrollo de funciones públicas, vulneren o amenacen el derecho constitucional de petición, la persona afectada puede ejercer la acción de tutela para reclamar ante los jueces la protección inmediata de su derecho.',NULL,NULL,1,6,3),(82,'¿Qué es la acción popular?','Desde hace algunos años en Colombia contamos con una figura jurídica muy importante para salvaguardar los intereses de grandes comunidades que se ven afectadas por el mismo hecho al mismo tiempo, la acción popular. En este artículo te explicaremos qué es, sus principales aspectos y características',NULL,NULL,1,7,3),(83,'¿Qué es la acción popular?','La acción popular es uno de los mecanismos de protección de los derechos e intereses colectivos de un grupo de personas (más de 20) a quienes posiblemente en un futuro se les vaya a vulnerar un derecho mediante una misma acción, es decir, en este caso la vulneración al derecho no ha ocurrido pero si no se previene mediante la interposición de esta acción posiblemente ocurra.',NULL,NULL,1,7,3),(84,'¿Cuál es la diferencia con la acción de grupo?','Existe una diferencia fundamental con la “acción de grupo” ya que en esta ultima la vulneración al derecho ya ocurrió y lo que se busca es indemnizar mientras que en la acción popular que es la que nos ocupa en el presente artículo la vulneración no ha ocurrido y lo que se busca es prevenirla.',NULL,NULL,1,7,3),(85,'¿Qué tipo de derechos protegen las acciones populares?','Todos aquellos derechos relacionados con el ambiente sano, moralidad administrativa, espacio público, patrimonio cultural, seguridad y salubridad pública, servicios públicos, consumidores y usuarios, libre competencia económica, etc.',NULL,NULL,1,7,3),(86,'¿Quiénes pueden interponer una acción popular?','Cualquier persona bien sea natural o jurídica, lo importante es que represente a un grupo de más de 20 personas. Para ejercitar esta acción  no se requiere actuar a través de abogado ya que si se desea puede hacerlo usted mismo.',NULL,NULL,1,7,3),(87,'¿Qué término existe para interponer las acciones populares?','Esta acción no tiene termino de caducidad , por lo tanto puede ser interpuesta en cualquier momento teniendo en cuenta que lo importante es que la vulneración no haya ocurrido caso en el cual dejaría de ser aplicable esta acción y procedería otra.',NULL,NULL,1,7,3),(88,'¿Qué es la acción de grupo?','Desde hace algunos años en Colombia contamos con una figura jurídica muy importante para salvaguardar los intereses de grandes comunidades que se ven afectadas por el mismo hecho al mismo tiempo. Existe de esta forma en Colombia  la llamada acción de grupo',NULL,NULL,1,5,3),(89,'Acción de grupo ','La acción de grupo es una figura jurídica que sirve para posibilitar la indemnización de perjuicios causados a un número plural de personas, sin perjuicio de la procedencia de las acciones particulares.',NULL,NULL,1,5,3),(90,'¿Cuáles es la finalidad de las acciones de grupo?','Esta acción tiene como finalidad exclusiva el reconocimiento y pago de la indemnización de los perjuicios originados tanto por la vulneración de derechos colectivos, como de derechos subjetivos de origen constitucional o legal.',NULL,NULL,1,5,3),(91,'¿Dónde encontramos el sustento legal?','Esta acción  se encuentra desarrollada por la ley 472 de 1998 en el artículo 3°. Su principal característica es que debe ser presentada por una pluralidad o conjunto de personas a las cuales se les haya causado un daño, es decir, que los perjuicios causados a cada uno de los integrantes del grupo debieron ser generados por las mismas causas, el artículo mencionado define la acción de grupo de la siguiente manera:\r\n“Son aquellas acciones interpuestas por un número plural o un conjunto de personas que reúnen condiciones uniformes respecto de una misma causa que originó perjuicios individuales para dichas personas”.',NULL,NULL,1,5,3),(92,'¿Qué tipo de derechos protege las acciones de grupo?','Todos aquellos derechos relacionados con ambiente sano, moralidad administrativa, espacio público, patrimonio cultural, seguridad y salubridad pública, servicios públicos, consumidores y usuarios, libre competencia económica, etc.',NULL,NULL,1,5,3),(93,'¿Cuáles son las principales características?','Es muy importante que no confundas la acción de grupo con la acción popular, ya que en la acción popular la finalidad es preventiva, mientras que la acción de grupo se caracteriza por ser indemnizatoria, ya que lo que busca es el resarcimiento de los daños causados al grupo.\r\nEl número plural de personas debe ser mínimo de 20 para que sea procedente.\r\nDeberá presentarse dentro de los dos años siguientes a la fecha en que se causó el daño o ceso la acción vulnerante que lo genero.\r\nDeber presentarse por intermedio de abogado.\r\nPuede ser presentada tanto porpersonas naturales como jurídicas que hayan sufrido de manera individual perjuicios, incluso el defensor del pueblo y los personeros municipales o distritales podrán interponerla en nombre de cualquier persona que lo haya solicitado o se encuentre en situación de desamparo o indefensión.\r\nDeberán ser presentadas ante el juez contencioso administrativo cuando el perjuicio haya sido causado por una entidad pública o por una entidad privada que desempeñe funciones administrativas, en las originadas en razón de actividades de otros entes será competente el juez civil del circuito.\r\nPese a que el conjunto de personas deber ser mínimo de 20 quien presenta la demanda representa a las demás personas afectadas.',NULL,NULL,1,5,3),(94,'Hábeas Data ¿Qué es?','Protección de datos personales\r\nMás información en: www.sic.gov.co','https://www.youtube.com/embed/Fo7h8IhWgBk',NULL,1,2,1),(95,'¿Qué es el Habeas Data en Colombia?','De acuerdo con el superintendente delegado para la Protección de Datos Personales, José Alejandro Bermúdez, El Habeas Data es el derecho que tienen todas las personas a conocer, actualizar y rectificar las informaciones que se hayan recogido sobre ellas en bancos de datos y en archivos de entidades públicas y privadas.',NULL,NULL,1,2,3),(96,'¿Cuando procede el habeas data?','Procede contra el hecho u omisión por parte de cualquier autoridad, funcionario o persona que vulnera o amenaza los siguientes derechos:\r\nA solicitar la información que requiera o a recibirla de cualquier entidad pública, salvo aquella que afecte la intimidad personal o que tiene que ver con la seguridad nacional.\r\nA que los servicios informáticos computarizados o no, públicos o privados, no den información que afecte la intimidad personal y familiar.',NULL,NULL,1,2,3),(97,'¿Ante quien se presenta la demanda de habeas data?','Ante los Jueces de Primera Instancia en lo Civil del lugar donde ocurrieron los hechos o del domicilio del autor de tales hechos.',NULL,NULL,1,2,3),(99,'¿Cuándo se puede aplicar el habeas data?','Como habeas data se denomina el derecho que tiene toda persona de conocer, corregir o actualizar toda aquella información que se relacione con ella y que se encuentre almacenada en centrales de información o bases de datos de organismos tanto públicos como privados.',NULL,NULL,1,2,3),(100,'¿Qué derecho protege el Habeas Data en Colombia?','El Habeas Data es un mecanismo constitucional del cual toda persona puede hacer uso, con el fin de proteger la seguridad y veracidad de sus datos e información personal aportados en entidades financieras y de telecomunicaciones entre otras, que por su naturaleza recopilan datos de sus clientes y usuarios',NULL,NULL,1,2,3),(101,'¿Qué dice la Ley Habeas Data?','Habeas Data: ¿Qué es? Corresponde al derecho fundamental que tiene toda persona para conocer, actualizar y rectificar toda aquella información que se relacione con ella y que se recopile o almacene en centrales de información.',NULL,NULL,1,2,3),(102,'¿Quién puede solicitar el habeas data?','Procede contra el hecho u omisión por parte de cualquier autoridad, funcionario o persona que vulnera o amenaza los siguientes derechos: A solicitar la información que requiera o a recibirla de cualquier entidad pública, salvo aquella que afecte la intimidad personal o que tiene que ver con la seguridad nacional.',NULL,NULL,1,2,3),(103,'¿Por qué es importante el habeas data?','El Habeas Data es considerado un derecho constitucional que tiene por objeto la protección integral de los datos personales anotados en registros, archivos, bancos de datos, y en su defecto otros medios de protección de datos sean éstos públicos, o privados destinados a dar información',NULL,NULL,1,2,3),(104,'¿Cuál es el objetivo del habeas data?','Se destaca que el Habeas data es un proceso constitucional con “fines diversos”, el cual apunta a “traer los datos” (así como el hábeas corpus procura “traer el cuerpo”) y su objetivo principal es contener ciertos excesos del llamado “poder informático”, protegiéndose el ámbito de libertad que solo incumbe a la persona',NULL,NULL,1,2,3),(105,'¿Qué es el habeas data en sentido propio?','celar los datos inexactos o indebidamente procesados y disponer sobre su transmisión”. Frosini se refiere a ella como “una nueva forma presentada por el derecho a la libertad personal… es decir, el derecho a controlar las informaciones sobre su propia persona, es el derecho al habeas data”.',NULL,NULL,1,2,3),(106,'¿Cuáles son los derechos fundamentales que protege?','El recurso de agravio constitucional denominado Hábeas Data, es una garantía que protege dos derechos fundamentales: el derecho a la información y la autodeterminación informativa o protección de datos personales; ambos, forman parte del ámbito de los derechos humanos, reconocidos y protegidos por los Tratados',NULL,NULL,1,2,3);

INSERT INTO `Opcion` (`idOpcion`, `Enunciado`, `Correcta`, `Pregunta_idPregunta`) VALUES (1,'Los derechos fundamentales',0,1),(2,'El derecho al trabajo',0,1),(3,'El derecho a la vida',0,1),(4,'La igualdad de genero',0,1),(5,'La Protección de Datos Personales',0,2),(6,'La protección del buen nombre',0,2),(7,'Contra la estafa',0,2),(8,'Los datos de las redes sociales',0,2),(9,'Ninguna de las anteriores',0,2),(10,'10 días',1,3),(11,'15 días',0,3),(12,'20 días',0,3),(13,'25',0,3),(14,'30',0,3),(15,'En cualquier sede judicial',1,4),(16,'La policía ',0,4),(17,'El ejercito',0,4),(18,'Defensoria del pueblo ',0,4),(19,'Contra autoridades públicas de cualquier orden territorial',0,5),(20,'Contra autoridades públicas prestación servicios',0,5),(21,'Particulares encargados de la prestación de un servicio público',0,5),(22,'El solicitante se halle en estado de subordinación',0,5),(23,'El solicitante se halle en estado  indefenso',0,5),(24,'Todas las anteriores',1,5),(25,'Proteger la seguridad y veracidad de sus datos e información personal',0,6),(26,'Evita el uso no autorizado de los datos',0,6),(27,'Todas las anteriores',1,6),(28,'Toda persona para conocer, actualizar y rectificar toda aquella información que se relacione con ella y que se recopile o almacene en centrales de información.',1,7),(29,'Elimina los datos que no quiere que se muestren ',0,7),(30,'El capturado',0,8),(31,'Abogado',0,8),(32,'Otra persona',0,8),(33,'Todas las anteriores',1,8),(34,'El incumplimiento de una norma con fuerza de ley (leyes, decretos extraordinarios, decretos legislativos) .',1,9),(35,'Es cuando lo detienen sin  causa',0,9),(36,'Es cuando usan sus datos personales sin permiso',0,9),(37,'El tribunal tiene 20 días para decidir.',1,10),(38,'El tribunal tiene 10 días para decidir.',0,10),(39,'El tribunal tiene 5 días para decidir.',0,10),(40,'Se ve afectado por el incumplimiento de una ley o acto administrativo',1,11),(41,'cuando no respetan los derechos fundamentales',0,11),(42,'Cuando se vencieron los términos y no alcanzo hacer el proceso',0,11),(43,'Ante el juez administrativo del domicilio del accionante. ',1,12),(44,'Ante la policía',0,12),(45,'La defensoria del pueblo',0,12),(46,'Ante cualquier  magistrado',0,12),(47,'Ante cualquier juez  ',0,12),(48,'Todas las anteriores',0,12),(49,'Ninguna de las anteriores',0,12),(50,'Máximo 36 horas',1,14),(51,'Máximo 36 días',0,14),(52,'Máximo 15 horas',0,14),(53,'Máximo 15 días',0,14),(54,'Demostrada la violación de las garantías constitucionales o legales, el juez inmediatamente ordenará la libertad ',1,15),(55,'Demostrada la violación de las garantías constitucionales o legales, el juez lo retiene 2 días más',0,15),(56,'Demostrada la violación de las garantías constitucionales o legales, el juez lo retiene 1 días más',0,15),(57,'La acción de grupo es una figura jurídica que sirve para posibilitar la indemnización de perjuicios causados a un número plural de personas',1,16),(58,'La acción de grupo es una figura jurídica que sirve para posibilitar la indemnización de perjuicios causados a un número singular de personas',0,16),(59,'La acción de grupo es una figura jurídica que sirve para posibilitar la indemnización de perjuicios causados a 2 personas',0,16),(60,'Esta acción tiene como finalidad exclusiva el reconocimiento y pago de la indemnización de los perjuicios originados tanto por la vulneración de derechos colectivos',1,17),(61,'Esta acción tiene como finalidad   la indemnización a una persona',0,17),(62,'Esta acción tiene como finalidad   la indemnización a una familia',0,17),(63,'Todos aquellos derechos relacionados con ambiente sano, moralidad administrativa, espacio público, patrimonio cultural, seguridad y salubridad pública, servicios públicos, consumidores y usuarios, libre competencia económica',1,18),(64,'Todos aquellos derechos relacionados con ambiente sano, moralidad administrativa, espacio público, patrimonio cultural, seguridad y salubridad pública, servicios públicos, consumidores y usuarios, libre competencia económica en un apartamento',0,18),(65,'Todos aquellos derechos relacionados con ambiente sano, moralidad administrativa, espacio público, patrimonio cultural, seguridad y salubridad pública, servicios públicos, consumidores y usuarios, libre competencia económica casa residencial ',0,18),(66,'Caracteriza por ser indemnizatoria',0,19),(67,'El número plural de personas debe ser mínimo de 20 para que sea procedente',0,19),(68,'Deberá presentarse dentro de los dos años siguientes a la fecha en que se causó el daño',0,19),(69,'Puede ser presentada tanto porpersonas naturales como jurídicas',0,19),(70,'Deberán ser presentadas ante el juez contencioso administrativo cuando el perjuicio haya sido causado por una entidad pública',0,19),(71,'Deberán ser presentadas ante el juez contencioso administrativo cuando el perjuicio haya sido causado   por una entidad privada que desempeñe funciones administrativas',0,19),(72,'Todas las anteriores',1,19),(73,'Una petición es la solicitud verbal o escrita que se presenta en forma respetuosa ante un servidor público',1,20),(74,'Una petición es la solicitud verbal o escrita que se presenta en forma respetuosa ante una empresa privada',0,20),(75,'Una petición es la solicitud verbal o escrita que se presenta en forma respetuosa ante una persona natural',0,20),(76,'Todo ser humano independientemente de las condiciones de sexo, edad, nacionalidad, estado civil',1,21),(77,'Cualquier Colombiano',0,21),(78,'Cualquier persona mayor de 30 años',0,21),(79,'Cualquier hombre casado',0,21),(80,'Las autoridades',0,22),(81,'Los particulares que presten un servicio público o actúen o deban actuar en desarrollo de funciones públicas',0,22),(82,'El legislador podrá reglamentar el ejercicio del derecho de petición ante las organizaciones privadas para garantizar los derechos fundamentales',0,22),(83,'Todas las anteriores',0,22),(84,'Sí. El derecho de acceso a documentos públicos puede ampararse bajo reserva en los casos que establezca la Ley',0,23),(85,'Los funcionarios públicos están autorizados para no permitir el acceso a aquellos documentos que sean reservados.',0,23),(86,'El carácter reservado de un documento no será oponible a las autoridades que lo soliciten en el debido ejercicio de sus funciones',0,23),(87,'Les corresponde a dichas autoridades asegurar su reserva.',0,23),(88,'Todas las anteriores',0,23),(89,'Quince (15) días para contestar quejas, reclamos y manifestaciones',0,24),(90,'Diez (10) días para contestar peticiones de información',0,24),(91,'Treinta (30) días para contestar consultas',0,24),(92,'Todas las anteriores',0,24);

INSERT INTO `Pregunta` (`idPregunta`, `Pregunta`, `Tema_idTema`) VALUES (1,'¿Qué defiende la acción de tutela?',1),(2,'¿Qué defiende Habeas data?',2),(3,'Tiempo en el que debe tener respuesta',1),(4,' ¿Dónde radicarla?',1),(5,'¿Contra quién procede?',1),(6,'¿Qué derecho protege el Habeas Data en Colombia?',2),(7,'¿Qué dice la Ley Habeas Data?',2),(8,'¿Quién puede interponerlo?',3),(9,'¿Qué es una acción de cumplimiento?',4),(10,'¿Cuántos días hábiles se tiene para responder?',4),(11,'¿Cuándo se solicita?',4),(12,'¿Ante quién se interpone?',4),(13,'¿Ante quién se interpone?',3),(14,'¿Termino para resolver el habeas corpus?',3),(15,'¿Cómo es la decisión del habeas corpus?',3),(16,'¿Qué es la acción de grupo?',5),(17,'¿Cuáles es la finalidad de las acciones de grupo?',5),(18,'¿Qué tipo de derechos protege las acciones de grupo?',5),(19,'¿Cuáles son las principales características?',5),(20,'¿Qué es una petición?',7),(21,'¿Quiénes tienen derecho a presentar peticiones?',7),(22,'¿Ante quién se puede ejercer el derecho de petición?',7),(23,'¿Hay límites al acceso de documentos públicos?',7),(24,'¿Tiempo para dar respuesta a las peticiones?',7);

INSERT INTO `Tema` (`idTema`, `NombreTema`, `Unidad_idUnidad`) VALUES (1,'Acción de Tuela',1),(2,'Habeas Data',1),(3,'Habeas Corpus',1),(4,'Acción de Cumplimiento',1),(5,'Acción de Grupo',1),(6,'Derecho de Petición',1),(7,'Acción Popular',1);

INSERT INTO `TipoMultimedia` (`idTipoMultimedia`, `TipoMultimedia`) VALUES (1,'video'),(2,'imagen'),(3,'texto'),(4,'audio');

INSERT INTO `Unidad` (`idUnidad`, `NombreUnidad`, `Modulo_idModulo`) VALUES (1,'Mecanismos de participación ciudadana',1);

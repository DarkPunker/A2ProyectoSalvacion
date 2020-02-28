const express = require('express');
const router = express.Router();


const pool = require('../database');
const { isLoggedIn, isLoggedInUser } = require('../lib/auth');
const { recortar, recortarid } = require('../lib/slipt');

router.get('/viewexamen', isLoggedInUser, async (req, res) => {
    const examen = await pool.query('CALL seeExamForUser (?)', [req.user.idUsuario]);
    res.render('clase/viewexamen', { examen: examen[0] });
});

router.get('/exam/:idExamen', isLoggedInUser, async (req, res) => {
    const { idExamen } = req.params;
    const Curso_idCurso = await pool.query('CALL getidCursoIsExam (?)', idExamen);
    const idCarrera = Curso_idCurso[0][0].Curso_idCurso;
    const pregunta = await pool.query('CALL ExamPreguntasOpciones (?)', idExamen);
    const resp = recortarid(pregunta[0]);
    const registro = await pool.query('CALL addUsuarioPresentaExamen (?,?,?)', [idExamen, req.user.idUsuario, idCarrera]);
    const idExamenPresentado = registro[0][0].insertId;
    res.render('clase/exam', { pregunta: resp, idExamen, idExamenPresentado, NombreExamen: Curso_idCurso[0][0].NombreExamen });
});

router.post('/exam/:idExamen/:idExamenPresentado', isLoggedInUser, async (req, res) => {
    const { idExamen, idExamenPresentado } = req.params;
    const pregunta = await pool.query('CALL seeOpcionesComparacion (?)', idExamen);
    const r = req.body;

    var punto = 5 / pregunta[0].length;
    var notafinal = 0;

    for (var index = 0; index < pregunta[0].length; index++) {
        var pre = pregunta[0][index].idPregunta
        var correcta = pregunta[0][index].idOpcion

        if (r[pre] == correcta) {
            notafinal += punto;
        }
    }
    var today = new Date();
    var date = today.getFullYear() + '-' + (today.getMonth() + 1) + '-' + today.getDate();
    var time = today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds();
    var dateTime = date + ' ' + time;
    await pool.query('CALL updateUsuarioPresentaExamen (?,?,?)', [notafinal, dateTime, idExamenPresentado]);
    res.redirect('/clase/viewexamen');


});

router.get('/viewclase/:idModulo', isLoggedInUser, async (req, res) => {
    const { idModulo } = req.params;
    const id = await pool.query('SELECT Curso_idCurso FROM Curso_has_Modulo INNER JOIN Modulo ON Modulo_idModulo = idModulo WHERE idModulo = ?', idModulo);
    const idCurso = id[0].Curso_idCurso;
    const data = await pool.query('CALL seeUnidadTema (?)', idModulo);
    const resp = recortarid(data[0]);
    const evaluacion = await pool.query('CALL getExamenidAndName (?)', idCurso);
    res.render('clase/viewclase', { data: resp, evaluacion: evaluacion[0] });
});

router.get('/viewclase/:idModulo/:idTema', isLoggedInUser, async (req, res) => {
    const { idModulo, idTema } = req.params;
    const id = await pool.query('SELECT Curso_idCurso FROM Curso_has_Modulo INNER JOIN Modulo ON Modulo_idModulo = idModulo WHERE idModulo = ?', idModulo);
    const idCurso = id[0].Curso_idCurso;
    const data = await pool.query('CALL seeUnidadTema (?)', idModulo);
    const resp = recortarid(data[0]);
    const multimedia = await pool.query('CALL getMultimediaIsTema (?)', idTema);
    const curso = await pool.query('CALL getCursoidCarrera (?)', idCurso);
    const evaluacion = await pool.query('CALL getExamenidAndName (?)', idCurso);
    const registro = await pool.query('CALL getUsuarioVeTema (?,?,?)', [idTema, req.user.idUsuario, curso[0].Curso_idCurso]);

    if (registro.length == 0) {
        await pool.query('CALL addUsuarioVeTema (?,?,?)', [idTema, req.user.idUsuario, curso[0].Curso_idCurso])
    }
    res.render('clase/viewclase', { data: resp, multimedia: multimedia[0], curso: curso[0], evaluacion: evaluacion[0] , Nombre: multimedia[0].NombreTema});
});

router.get('/viewcarrera', isLoggedInUser, async (req, res) => {
    const carrera = await pool.query('SELECT * FROM Carrera');
    res.render('clase/viewcarrera', { carrera: carrera });
});

router.get('/viewcarrera/:idCarrera', isLoggedInUser, async (req, res) => {
    const { idCarrera } = req.params;
    const newregistro = {
        Usuario_idUsuario: req.user.idUsuario,
        Carrera_idCarrera: idCarrera
    }
    const registro = await pool.query('CALL getUsuarioInscripcionCarrera (?,?)', [req.user.idUsuario, idCarrera]);
    if (registro[0].length == 0) {
        await pool.query('CALL UsuarioInscripcionCarrera (?,?)', [newregistro.Usuario_idUsuario, newregistro.Carrera_idCarrera])
    }
    const curso = await pool.query('CALL getCursoidAndName (?)', idCarrera);
    console.log(curso[0]);
    
    res.render('clase/viewcarrera', { curso: curso[0] });
});

module.exports = router;

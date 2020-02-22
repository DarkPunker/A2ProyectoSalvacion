const express = require('express');
const router = express.Router();


const pool = require('../database');
const { isLoggedIn, isLoggedInUser } = require('../lib/auth');

router.get('/viewexamen', isLoggedInUser, async (req, res) => {
    const examen = await pool.query('CALL seeExamForUser (?)', [req.user.idUsuario]);
    res.render('clase/viewexamen', { examen: examen[0] });
});

router.get('/exam/:idExamen', isLoggedInUser, async (req, res) => {
    const { idExamen } = req.params;
    const Curso_idCurso = await pool.query('CALL getidCursoIsExam (?)', idExamen);
    const idCarrera = Curso_idCurso[0][0].Curso_idCurso;
    const pregunta = await pool.query('CALL ExamPreguntasOpciones (?)', idExamen);
    console.log(pregunta[0]);
    
    var resp = pregunta[0].map(function (item) {

        var respuesta = item.respuestas.split("-");

        var jsonRes = []
        for (var index = 0; index < respuesta.length; index++) {
            var datos = respuesta[index].split(":")
            jsonRes.push({ idPregunta: item.idPregunta, id: datos[0], respuesta: datos[1] })
        }

        return { ...item, respuestas: jsonRes }
    })
    const registro = await pool.query('CALL addUsuarioPresentaExamen (?,?,?)', [idExamen, req.user.idUsuario, idCarrera]);
    const idExamenPresentado = registro.insertId;

    res.render('clase/exam', { pregunta: resp, idExamen, idExamenPresentado });
});

router.post('/exam/:idExamen/:idExamenPresentado', isLoggedInUser, async (req, res) => {
    const { idExamen, idExamenPresentado } = req.params;
    const pregunta = await pool.query('CALL seeOpcionesComparacion (?)', idExamen);
    const r = req.body;
    console.log(pregunta);
    
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

    console.log(dateTime);
    

    await pool.query('CALL updateUsuarioPresentaExamen (?,?,?)', [notafinal, dateTime, idExamenPresentado]);

    res.redirect('/clase/viewexamen');


});

router.get('/viewclase/:idCurso', isLoggedInUser, async (req, res) => {
    const { idCurso } = req.params;
    const data = await pool.query('CALL seeModuloUnidadTema (?)', idCurso);
    const evaluacion = await pool.query('CALL getExamenidAndName (?)', idCurso);
    res.render('clase/viewclase', { data: data[0], evaluacion: evaluacion[0] });
});

router.get('/viewclase/:idCurso/:idTema', isLoggedInUser, async (req, res) => {
    const { idCurso, idTema } = req.params;
    const data = await pool.query('CALL seeModuloUnidadTema (?)', idCurso);
    const multimedia = await pool.query('CALL getMultimediaIsTema (?)', idTema);
    const curso = await pool.query('CALL getCursoidCarrera (?)', idCurso);
    const evaluacion = await pool.query('CALL getExamenidAndName (?)', idCurso);
    const registro = await pool.query('CALL getUsuarioVeTema (?,?,?)', [idTema, req.user.idUsuario, curso[0].Curso_idCurso]);

    if (registro.length == 0) {
        await pool.query('CALL addUsuarioVeTema (?,?,?)', [idTema, req.user.idUsuario, curso[0].Curso_idCurso])
    }

    res.render('clase/viewclase', { data: data[0], multimedia: multimedia[0], curso: curso[0], evaluacion: evaluacion[0] });
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
    if (registro.length == 0) {
        await pool.query('CALL UsuarioInscripcionCarrera (?,?)', [newregistro.Usuario_idUsuario, newregistro.Carrera_idCarrera])
    }
    const curso = await pool.query('CALL getCursoidAndName (?)', idCarrera);
    res.render('clase/viewcarrera', { curso: curso[0] });
});

module.exports = router;

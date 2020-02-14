const express = require('express');
const router = express.Router();


const pool = require('../database');
const { isLoggedIn, isLoggedInUser } = require('../lib/auth');

router.get('/viewexamen', isLoggedInUser, async (req, res) => {
    const examen = await pool.query('SELECT * FROM Examen INNER JOIN UsuarioPresentaExamen ON idExamen = Examen_idExamen WHERE UsuarioInscripcionCarrera_Usuario_idUsuario = ?', [req.user.idUsuario]);
    console.log(examen);
    
    res.render('clase/viewexamen', {examen});
});

router.get('/exam/:idExamen', isLoggedInUser, async (req, res) => {
    const { idExamen } = req.params;
    const Curso_idCurso = await pool.query('SELECT Curso.Curso_idCurso FROM Curso_has_Examen INNER JOIN Curso ON Curso_has_Examen.Curso_idCUrso = Curso.idCurso WHERE Examen_idExamen = ?', idExamen);
    const idCarrera = Curso_idCurso[0].Curso_idCurso;
    const pregunta = await pool.query('CALL ExamPreguntasOpciones (?)', idExamen);
    var resp = pregunta[0].map(function (item) {

        var respuesta = item.respuestas.split("-");

        var jsonRes = []
        for (var index = 0; index < respuesta.length; index++) {
            var datos = respuesta[index].split(":")
            jsonRes.push({ idPregunta: item.idPregunta, id: datos[0], respuesta: datos[1] })
        }

        return { ...item, respuestas: jsonRes }
    })
    const registro = await pool.query('INSERT INTO UsuarioPresentaExamen (Examen_idExamen, UsuarioInscripcionCarrera_Usuario_idUsuario, UsuarioInscripcionCarrera_Carrera_idCarrera) VALUE (?,?,?)', [idExamen, req.user.idUsuario, idCarrera]);
    const idExamenPresentado = registro.insertId;

    res.render('clase/exam', { pregunta: resp, idExamen, idExamenPresentado });
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
    

    await pool.query('UPDATE UsuarioPresentaExamen SET Calificacion = ?, HoraFin = ? WHERE idExamenPresentado = ?', [notafinal ,dateTime, idExamenPresentado]);

    res.redirect('/clase/viewexamen');


});

router.get('/viewclase/:idCurso', isLoggedInUser, async (req, res) => {
    const { idCurso } = req.params;
    const data = await pool.query('CALL seeModuloUnidadTema (?)', idCurso);
    const evaluacion = await pool.query('SELECT * FROM examen INNER JOIN Curso_has_Examen ON idExamen = Examen_idExamen WHERE Curso_idCurso = ?', idCurso);
    console.log(evaluacion);

    res.render('clase/viewclase', { data: data[0], evaluacion });
});

router.get('/viewclase/:idCurso/:idTema', isLoggedInUser, async (req, res) => {
    const { idCurso, idTema } = req.params;
    const data = await pool.query('CALL seeModuloUnidadTema (?)', idCurso);
    const multimedia = await pool.query('SELECT * FROM tema INNER JOIN multimedia ON idTema=Tema_idTema WHERE idTema = ?', idTema);
    const curso = await pool.query('SELECT * FROM curso WHERE idCurso = ?', idCurso);
    const evaluacion = await pool.query('SELECT * FROM examen INNER JOIN Curso_has_Examen ON idExamen = Examen_idExamen WHERE Curso_idCurso = ?', idCurso);
    const registro = await pool.query('SELECT * FROM UsuarioVeTema WHERE Tema_idTema = ? AND UsuarioInscripcionCarrera_Usuario_idUsuario = ? AND UsuarioInscripcionCarrera_Carrera_idCarrera = ?', [idTema, req.user.idUsuario, curso[0].Curso_idCurso]);

    if (registro.length == 0) {
        await pool.query('INSERT INTO UsuarioVeTema (Tema_idTema, UsuarioInscripcionCarrera_Usuario_idUsuario, UsuarioInscripcionCarrera_Carrera_idCarrera) VALUE (?,?,?)', [idTema, req.user.idUsuario, curso[0].Curso_idCurso])
    }

    res.render('clase/viewclase', { data: data[0], multimedia, curso: curso[0],  evaluacion });
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
    const registro = await pool.query('SELECT * FROM UsuarioInscripcionCarrera WHERE Usuario_idUsuario = ? AND Carrera_idCarrera = ?', [req.user.idUsuario, idCarrera]);
    if (registro.length == 0) {
        await pool.query('INSERT INTO UsuarioInscripcionCarrera (Usuario_idUsuario, Carrera_idCarrera) VALUE (?,?)', [newregistro.Usuario_idUsuario, newregistro.Carrera_idCarrera])
    }
    const curso = await pool.query('SELECT * FROM curso WHERE Curso_idCurso = ?', idCarrera);
    res.render('clase/viewcarrera', { curso: curso });
});

module.exports = router;
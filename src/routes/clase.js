const express = require('express');
const router = express.Router();


const pool = require('../database');
const { isLoggedIn, isLoggedInUser } = require('../lib/auth');

router.get('/exam/:idCurso', isLoggedInUser, async (req, res) => {
    const { idCurso } = req.params;
    const pregunta = await pool.query('CALL seeOpciones (?)', idCurso);
    var resp = pregunta[0].map(function (item) {

        var respuesta = item.respuestas.split("-");

        var jsonRes = []
        for (var index = 0; index < respuesta.length; index++) {
            var datos = respuesta[index].split(":")
            jsonRes.push({ idPregunta: item.idPregunta, id: datos[0], respuesta: datos[1] })
        }

        return { ...item, respuestas: jsonRes }
    })
    res.render('clase/exam', { pregunta: resp, idCurso });
});

router.post('/exam/:idCurso', isLoggedInUser, async (req, res) => {
    const { idCurso } = req.params;
    const pregunta = await pool.query('CALL seeOpcionesComparacion (?)', idCurso);
    const r = req.body;
    var punto = 5/pregunta[0].length;
    var notafinal = 0;

    for (var index = 0; index < pregunta[0].length; index++) {
        var pre = pregunta[0][index].idPregunta
        var correcta = pregunta[0][index].idOpcion

        if (r[pre] == correcta) {
            notafinal+=punto;

        }

        
        

    }
    console.log(notafinal);
    
    res.send('enviado')


});

router.get('/viewclase/:idCurso', isLoggedInUser, async (req, res) => {
    const { idCurso } = req.params;
    const data = await pool.query('CALL seeModuloUnidadTema (?)', idCurso);
    const curso = await pool.query('SELECT * FROM curso WHERE idCurso = ?', idCurso);
    res.render('clase/viewclase', { data: data[0], curso: curso[0] });
});

router.get('/viewclase/:idCurso/:idTema', isLoggedInUser, async (req, res) => {
    const { idCurso, idTema } = req.params;
    const data = await pool.query('CALL seeModuloUnidadTema (?)', idCurso);
    const multimedia = await pool.query('SELECT * FROM tema INNER JOIN multimedia ON idTema=Tema_idTema WHERE idTema = ?', idTema);
    console.log(multimedia);

    const curso = await pool.query('SELECT * FROM curso WHERE idCurso = ?', idCurso);
    res.render('clase/viewclase', { data: data[0], multimedia, curso: curso[0] });
});

router.get('/viewcarrera', isLoggedInUser, async (req, res) => {
    const carrera = await pool.query('SELECT * FROM carrera');
    res.render('clase/viewcarrera', { carrera: carrera });
});

router.get('/viewcarrera/:idCarrera', isLoggedInUser, async (req, res) => {
    const { idCarrera } = req.params;
    const registro = await pool.query('SELECT * FROM UsuarioInscripcionCarrera WHERE Carrera_idCarrera = ?', idCarrera);
    const curso = await pool.query('SELECT * FROM curso WHERE Curso_idCurso = ?', idCarrera);
    /* var conf = true;
    console.log(user.idUsuario);
    
    for (var index = 0; index < registro[0].length; index++) {
        if (registro[0][index].Usuario_idUsuario == user.idUsuario) {
            conf = false;
        }
        
    } */
    res.render('clase/viewcarrera', { curso: curso });
});

module.exports = router;
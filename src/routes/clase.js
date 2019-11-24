const express = require('express');
const router = express.Router();


const pool = require('../database');
const { isLoggedIn, isLoggedInUser } = require('../lib/auth');

router.get('/exam/:idCurso', isLoggedInUser, async (req, res) => {
    const { idCurso } = req.params;
    const pregunta = await pool.query('CALL seeOpciones (?)', idCurso);
    /* console.log(pregunta[0]); */

    res.render('clase/exam', { pregunta: pregunta[0] });
});

router.post('/exam/:idCurso', isLoggedInUser, async (req, res) => {
    const { idCurso } = req.params;
    const pregunta = await pool.query('CALL seeOpciones (?)', idCurso);
    var a = [];
    for (i = 0; i < pregunta[0].length; i++) {
        a[i] = pregunta[0][i].idOpcion;
    }
    /* const { a } = req.body */
    
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
    const curso = await pool.query('SELECT * FROM curso WHERE idCurso = ?', idCurso);
    res.render('clase/viewclase', { data: data[0], multimedia, curso: curso[0] });
});

router.get('/viewcarrera', isLoggedInUser, async (req, res) => {
    const carrera = await pool.query('SELECT * FROM carrera');
    res.render('clase/viewcarrera', { carrera: carrera });
});

router.get('/viewcarrera/:idCarrera', isLoggedInUser, async (req, res) => {
    const { idCarrera } = req.params;
    const curso = await pool.query('SELECT * FROM curso WHERE Curso_idCurso = ?', idCarrera);
    res.render('clase/viewcarrera', { curso: curso });
});

module.exports = router;
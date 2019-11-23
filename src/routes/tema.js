const express = require('express');
const router = express.Router();
const pool = require('../database');
const { isLoggedIn, isLoggedInUser } = require('../lib/auth');

router.get('/addtema', isLoggedIn, async (req, res) => {
    const carrera = await pool.query('SELECT * FROM carrera');
    res.render('tema/addtema', { carrera: carrera });
});

router.get('/addtema/:idCarrera', isLoggedIn, async (req, res) => {
    const { idCarrera } = req.params;
    const carrera = await pool.query('SELECT * FROM carrera');
    const curso = await pool.query('SELECT * FROM curso WHERE Curso_idCurso = ?', idCarrera)
    res.render('tema/addtema', { carrera: carrera, curso: curso });
});

router.get('/addtema/:Curso_idCurso/:idCurso', isLoggedIn, async (req, res) => {
    const { Curso_idCurso, idCurso } = req.params;
    const carrera = await pool.query('SELECT * FROM carrera');
    const curso = await pool.query('SELECT * FROM curso WHERE Curso_idCurso = ?', Curso_idCurso);
    const modulo = await pool.query('CALL seeModuloidCarreraidCurso (?)', idCurso);
    res.render('tema/addtema', { carrera, curso, modulo: modulo[0] });
});

router.get('/addtema/:idCarrera/:idCurso/:idModulo', isLoggedIn, async (req, res) => {
    const { idCarrera, idCurso, idModulo } = req.params;
    const carrera = await pool.query('SELECT * FROM carrera');
    const curso = await pool.query('SELECT * FROM curso WHERE Curso_idCurso = ?', idCarrera);
    const modulo = await pool.query('CALL seeModuloidCarreraidCurso (?)', idCurso);
    const unidad = await pool.query('SELECT * FROM unidad WHERE Modulo_idModulo = ?', idModulo);
    res.render('tema/addtema', { carrera, curso, modulo: modulo[0], unidad });
});

router.post('/addtema', isLoggedIn, async (req, res) => {
    const { NombreTema } = req.body;
    const Unidad_idUnidad = parseInt(req.body.selunidad);
    const newTema = {
        NombreTema,
        Unidad_idUnidad
    };
    await pool.query('INSERT INTO tema set ?', [newTema]);
    req.flash('success', 'Tema Guardado Correctamente');
    res.redirect('/tema/gestionartema');
});

module.exports = router;
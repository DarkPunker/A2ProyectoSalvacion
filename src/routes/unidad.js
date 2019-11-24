const express = require('express');
const router = express.Router();
const pool = require('../database');
const { isLoggedIn, isLoggedInUser } = require('../lib/auth');

router.get('/addunidad', isLoggedIn, async (req, res) => {
    const carrera = await pool.query('SELECT * FROM carrera');
    res.render('unidad/addunidad', { carrera: carrera });
});

router.get('/addunidad/:idCarrera', isLoggedIn, async (req, res) => {
    const { idCarrera } = req.params;
    const carrera = await pool.query('SELECT * FROM carrera');
    const curso = await pool.query('SELECT * FROM curso WHERE Curso_idCurso = ?', idCarrera)
    res.render('unidad/addunidad', { carrera: carrera, curso: curso });
});

router.get('/addunidad/:Curso_idCurso/:idCurso', isLoggedIn, async (req, res) => {
    const { Curso_idCurso, idCurso } = req.params;
    const carrera = await pool.query('SELECT * FROM carrera');
    const curso = await pool.query('SELECT * FROM curso WHERE Curso_idCurso = ?', Curso_idCurso);
    const modulo = await pool.query('CALL seeModulo (?)', idCurso);
    res.render('unidad/addunidad', { carrera, curso, modulo: modulo[0] });
});

router.post('/addunidad', isLoggedIn, async (req, res) => {
    const { NombreUnidad } = req.body;
    const Modulo_idModulo = parseInt(req.body.selmodulo);
    const newUnidad = {
        NombreUnidad,
        Modulo_idModulo
    };
    await pool.query('INSERT INTO unidad set ?', [newUnidad]);
    req.flash('success', 'Unidad Guardado Correctamente');
    res.redirect('/unidad/gestionarunidad');
});

router.get('/gestionarunidad', isLoggedIn, async (req, res) => {
    const links = await pool.query('SELECT * FROM seeAllUnidadModuloCursoCarrera');
    res.render('unidad/gestionarunidad', { links: links });
});

router.get('/editunidad/:idUnidad', isLoggedIn, async (req, res) => {
    const { idUnidad } = req.params;
    const links = await pool.query('SELECT * FROM unidad WHERE idUnidad = ?', [idUnidad])
    res.render('unidad/editunidad', { link: links[0] });
});

router.post('/editunidad/:idUnidad', isLoggedIn, async (req, res) => {
    const { idUnidad } = req.params;
    const { NombreUnidad } = req.body;
    const newLink = {
        NombreUnidad,
    };
    await pool.query('UPDATE unidad set ? WHERE idUnidad = ?', [newLink, idUnidad]);
    req.flash('success', 'Unidad Modificado Correctamente');
    res.redirect('/unidad/gestionarunidad');
});

module.exports = router;
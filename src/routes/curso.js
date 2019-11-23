const express = require('express');
const router = express.Router();
const pool = require('../database');
const { isLoggedIn, isLoggedInUser } = require('../lib/auth');

router.get('/gestionarcurso', isLoggedIn, async (req, res) => {
    const links = await pool.query('SELECT * FROM carrera INNER JOIN curso ON carrera.idCarrera = curso.Curso_idCurso');
    res.render('curso/gestionarcurso', { links: links });
});

router.get('/addcurso', isLoggedIn, async (req, res) => {
    const carrera = await pool.query('SELECT * FROM carrera');
    res.render('curso/addcurso', { carrera: carrera });
});

router.post('/addcurso', isLoggedIn, async (req, res) => {
    const idcurso = req.body.carrera
    const { NombreCurso, FechaInicio, FechaFin } = req.body;
    const newCurso = {
        NombreSubCurso: NombreCurso,
        FechaInicio,
        FechaFin,
        Curso_idCurso: idcurso
    };
    await pool.query('INSERT INTO curso set ?', [newCurso]);
    req.flash('success', 'Curso Guardado Correctamente');
    res.redirect('/curso/gestionarcurso');
});

router.get('/editcurso/:idCurso', isLoggedIn, async (req, res) => {
    const { idCurso } = req.params;
    const links = await pool.query('SELECT * FROM curso WHERE idCurso = ?', [idCurso])
    console.log(links);
    
    res.render('curso/editcurso', { link: links[0] });
});

router.post('/editcurso/:idCurso', isLoggedIn, async (req, res) => {
    const { idCurso } = req.params;
    const { NombreSubCurso } = req.body;
    const newLink = {
        NombreSubCurso,
    };
    await pool.query('UPDATE curso set ? WHERE idCurso = ?', [newLink, idCurso]);
    req.flash('success', 'Curso Modificado Correctamente');
    res.redirect('/curso/gestionarcurso');
});

module.exports = router;
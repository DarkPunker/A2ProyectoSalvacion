const express = require('express');
const router = express.Router();


const pool = require('../database');
const { isLoggedIn, isLoggedInUser } = require('../lib/auth');

router.get('/gestionarcarrera', isLoggedIn, async (req, res) => {
    const links = await pool.query('SELECT * FROM Carrera');
    res.render('carrera/gestionarcarrera', { links: links });
});

router.get('/editcarrera/:idCarrera', isLoggedIn, async (req, res) => {
    const { idCarrera } = req.params;
    const links = await pool.query('CALL seeCarreraForId (?)', [idCarrera])
    res.render('carrera/editcarrera', { link: links[0][0] });
});

router.post('/editcarrera/:idCarrera', isLoggedIn, async (req, res) => {
    const { idCarrera } = req.params;
    const { NombreCurso, DescripcionCurso } = req.body;
    await pool.query('CALL modificarCarrera (?,?,?)', [idCarrera, NombreCurso, DescripcionCurso]);
    req.flash('success', 'Carrera Modificada Correctamente');
    res.redirect('/carrera/gestionarcarrera');
});

router.get('/addcarrera', isLoggedIn, (req, res) => {
    res.render('carrera/addcarrera');
});

router.post('/addcarrera', isLoggedIn, async (req, res) => {
    const { NombreCurso, DescripcionCurso} = req.body;
    const newCarrera = {
        NombreCurso,
        DescripcionCurso
    };
    /* const check = await pool.query('CALL returnIfNotExistOrNotCarreraName (?,@output)', [NombreCurso]);
    console.log(check); */
    await pool.query('CALL addCarrera (?,?)', [newCarrera.NombreCurso, newCarrera.DescripcionCurso])
    req.flash('success', 'Carrera Guardada Correctamente');
    res.redirect('/carrera/gestionarcarrera');
});

module.exports = router;
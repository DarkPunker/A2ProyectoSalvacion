const express = require('express');
const router = express.Router();


const pool = require('../database');
const { isLoggedIn, isLoggedInUser } = require('../lib/auth');

router.get('/gestionarcarrera', isLoggedIn, async (req, res) => {
    const links = await pool.query('SELECT * FROM Carrera');
    res.render('carrera/gestionarcarrera', { links: links });
});

router.get('/delete/:idCarrera', isLoggedIn, async (req, res) => {
    const { idCarrera } = req.params;
    await pool.query('DELETE FROM Carrera WHERE idCarrera = ?', [idCarrera]);
    req.flash('success', 'Carrera Eliminada Correctamente');
    res.redirect('/carrera/gestionarcarrera');
});

router.get('/editcarrera/:idCarrera', isLoggedIn, async (req, res) => {
    const { idCarrera } = req.params;
    const links = await pool.query('CALL seeCarreraForId (?)', [idCarrera])
    res.render('carrera/editcarrera', { link: links[0] });
});

router.post('/editcarrera/:idCarrera', isLoggedIn, async (req, res) => {
    const { idCarrera } = req.params;
    const { NombreCurso, DescripcionCurso } = req.body;
    const newLink = {
        NombreCurso,
        DescripcionCurso
    };
    await pool.query('UPDATE carrera set ? WHERE idCarrera = ?', [newLink, idCarrera]);
    req.flash('success', 'Carrera Modificada Correctamente');
    res.redirect('/carrera/gestionarcarrera');
});

router.get('/addcarrera', isLoggedIn, (req, res) => {
    res.render('carrera/addcarrera');
});

router.post('/addcarrera', isLoggedIn, async (req, res) => {
    const { NombreCurso, DescripcionCurso, NombreSubCurso, Nombre, NombreUnidad } = req.body;
    const newCarrera = {
        NombreCurso,
        DescripcionCurso,
        NombreSubCurso,
        Nombre,
        NombreUnidad
    };
    await pool.query('CALL addCarreraCursoModuloUnidad (?,?,?,?,?)', [newCarrera.NombreCurso, newCarrera.DescripcionCurso, newCarrera.NombreSubCurso, newCarrera.Nombre, newCarrera.NombreUnidad])
    req.flash('success', 'Carrera Guardada Correctamente');
    res.redirect('/carrera/gestionarcarrera');
});

module.exports = router;
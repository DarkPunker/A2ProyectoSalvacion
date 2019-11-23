const express = require('express');
const router = express.Router();

const pool = require('../database');
const { isLoggedIn, isLoggedInUser } = require('../lib/auth');

router.get('/addmodulo', isLoggedIn, async (req, res) => {
    const carrera = await pool.query('SELECT * FROM carrera');
    res.render('modulo/addmodulo', { carrera: carrera });
});

router.get('/addmodulo/:idCarrera', isLoggedIn, async (req, res) => {
    const { idCarrera } = req.params;
    const carrera = await pool.query('SELECT * FROM carrera');
    const curso = await pool.query('SELECT * FROM curso WHERE Curso_idCurso = ?', idCarrera)
    res.render('modulo/addmodulo', { carrera: carrera, curso: curso });
});

router.post('/addmodulo', isLoggedIn, async (req, res) => {
    const { Nombre } = req.body;
    const idcurso = parseInt(req.body.selcurso);
    const newModulo = {
        Nombre,
        idcurso
    };
    await pool.query('CALL addModulo (?,?)', [newModulo.idcurso, newModulo.Nombre]);
    req.flash('success', 'Modulo Guardado Correctamente');
    res.redirect('/modulo/gestionarmodulo');
});

router.get('/gestionarmodulo', isLoggedIn, async (req, res) => {
    const links = await pool.query('SELECT * FROM seeAllModuloCursoCarrera');
    console.log(links);
    
    res.render('modulo/gestionarmodulo', { links: links });
});

router.get('/editmodulo/:idModulo', isLoggedIn, async (req, res) => {
    const { idModulo } = req.params;
    const links = await pool.query('SELECT * FROM modulo WHERE idModulo = ?', [idModulo])
    console.log(links);
    
    res.render('modulo/editmodulo', { link: links[0] });
});

router.post('/editmodulo/:idModulo', isLoggedIn, async (req, res) => {
    const { idModulo } = req.params;
    const { Nombre } = req.body;
    const newLink = {
        Nombre,
    };
    await pool.query('UPDATE modulo set ? WHERE idModulo = ?', [newLink, idModulo]);
    req.flash('success', 'Modulo Modificado Correctamente');
    res.redirect('/modulo/gestionarmodulo');
});


module.exports = router;
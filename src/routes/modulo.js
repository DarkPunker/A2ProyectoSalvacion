const express = require('express');
const router = express.Router();

const pool = require('../database');
const { isLoggedIn, isLoggedInUser } = require('../lib/auth');

router.get('/addmodulo', isLoggedIn, async (req, res) => {
    const carrera = await pool.query('SELECT * FROM seeAllCarrera');
    res.render('modulo/addmodulo', { carrera: carrera });
});

router.get('/addmodulo/:idCarrera', isLoggedIn, async (req, res) => {
    const { idCarrera } = req.params;
    const carrera = await pool.query('SELECT * FROM seeAllCarrera');
    const curso = await pool.query('CALL getCursoForId (?)', idCarrera)
    res.render('modulo/addmodulo', { carrera: carrera, curso: curso[0] });
});

router.post('/addmodulo', isLoggedIn, async (req, res) => {
    const { Nombre } = req.body;
    const idcurso = parseInt(req.body.selcurso);
    const newModulo = {
        Nombre,
        idcurso
    };
    var success = "";
    const check = await pool.query("SET @output = 0;CALL returnIfNotExistOrNotModuloName (?,@output); SELECT @output AS Ok;", [Nombre]);
    if (check[2][0].Ok != 0) {
        success = 'Nombre ya en uso';
        const carrera = await pool.query('SELECT * FROM seeAllCarrera');
        res.render('modulo/addmodulo', { success, carrera, Nombre});
    } else {
        await pool.query('CALL addModulo (?,?)', [newModulo.idcurso, newModulo.Nombre]);
        req.flash('success', 'Modulo Guardado Correctamente');
        res.redirect('/modulo/gestionarmodulo');
    }
});

router.get('/gestionarmodulo', isLoggedIn, async (req, res) => {
    const links = await pool.query('SELECT * FROM seeAllModuloCursoCarrera');
    res.render('modulo/gestionarmodulo', { links: links });
});

router.get('/editmodulo/:idModulo', isLoggedIn, async (req, res) => {
    const { idModulo } = req.params;
    const links = await pool.query('CALL getModuloForId (?)', [idModulo])
    res.render('modulo/editmodulo', { link: links[0][0] });
});

router.post('/editmodulo/:idModulo', isLoggedIn, async (req, res) => {
    const { idModulo } = req.params;
    const { Nombre } = req.body;
    const newLink = {
        Nombre,
    };
    await pool.query('UPDATE Modulo set ? WHERE idModulo = ?', [newLink, idModulo]);
    req.flash('success', 'Modulo Modificado Correctamente');
    res.redirect('/modulo/gestionarmodulo');
});


module.exports = router;
const express = require('express');
const router = express.Router();
const pool = require('../database');
const { isLoggedIn, isLoggedInUser } = require('../lib/auth');

router.get('/gestionarcurso', isLoggedIn, async (req, res) => {
    const links = await pool.query('SELECT * FROM seeAllCarreraCurso');
    var resp = links.map(function (item) {
        var curso = item.Cursos.split("-");
        var jsonRes = []
        for (var index = 0; index < curso.length; index++) {
            var datos = curso[index].split(":")
            jsonRes.push({ idCarrera: item.idCarrera, idCurso: datos[0], NombreSubCurso: datos[1] })
        }

        return { ...item, Cursos: jsonRes }

    })
    res.render('curso/gestionarcurso', { Carrera: resp });
});

router.get('/addcurso', isLoggedIn, async (req, res) => {
    const carrera = await pool.query('SELECT * FROM seeAllCarrera');
    res.render('curso/addcurso', { carrera: carrera });
});

router.post('/addcurso', isLoggedIn, async (req, res) => {
    const idcurso = req.body.carrera
    const { NombreSubCurso, FechaInicio, FechaFin } = req.body;
    const newCurso = {
        NombreSubCurso,
        FechaInicio,
        FechaFin,
        Curso_idCurso: idcurso
    };
    var success = "";
    const check = await pool.query("SET @output = 0;CALL returnIfNotExistOrNotCursoName (?,@output); SELECT @output AS Ok;", [NombreSubCurso]);
    if (check[2][0].Ok != 0) {
        success = 'Nombre ya en uso';
        const carrera = await pool.query('SELECT * FROM seeAllCarrera');
        res.render('curso/addcurso', { success, carrera, NombreSubCurso, FechaInicio, FechaFin });
    } else {
        await pool.query('INSERT INTO Curso set ?', [newCurso]);
        req.flash('success', 'Curso Guardado Correctamente');
        res.redirect('/curso/gestionarcurso');
    }
});

router.get('/editcurso/:idCurso', isLoggedIn, async (req, res) => {
    const { idCurso } = req.params;
    const links = await pool.query('CALL getCursoForId (?)', [parseInt(idCurso)])
    res.render('curso/editcurso', { link: links[0][0] });
});

router.post('/editcurso/:idCurso', isLoggedIn, async (req, res) => {
    const { idCurso } = req.params;
    const { NombreSubCurso } = req.body;
    await pool.query('CALL updateCursoName (?,?)', [idCurso, NombreSubCurso]);
    req.flash('success', 'Curso Modificado Correctamente');
    res.redirect('/curso/gestionarcurso');
});

module.exports = router;
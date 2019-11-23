const express = require('express');
const router = express.Router();


const pool = require('../database');
const { isLoggedIn, isLoggedInUser } = require('../lib/auth');

router.get('/exam/:idCurso', isLoggedInUser, async (req, res) => {
    const { idCurso } = req.params;
    const pregunta = await pool.query('CALL seeOpciones (?)', idCurso);
    /* console.log(pregunta[0]); */

    res.render('other/exam', { pregunta: pregunta[0] });
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
    res.render('carrera/viewclase', { data: data[0], curso: curso[0] });
});

router.get('/viewclase/:idCurso/:idTema', isLoggedInUser, async (req, res) => {
    const { idCurso, idTema } = req.params;
    const data = await pool.query('CALL seeModuloUnidadTema (?)', idCurso);
    const multimedia = await pool.query('SELECT * FROM tema INNER JOIN multimedia ON idTema=Tema_idTema WHERE idTema = ?', idTema);
    const curso = await pool.query('SELECT * FROM curso WHERE idCurso = ?', idCurso);
    console.log(curso);

    res.render('carrera/viewclase', { data: data[0], multimedia, curso: curso[0] });
});

router.get('/viewcarrera', isLoggedInUser, async (req, res) => {
    const carrera = await pool.query('SELECT * FROM carrera');
    res.render('carrera/viewcarrera', { carrera: carrera });
});

router.get('/viewcarrera/:idCarrera', isLoggedInUser, async (req, res) => {
    const { idCarrera } = req.params;
    const curso = await pool.query('SELECT * FROM curso WHERE Curso_idCurso = ?', idCarrera);
    res.render('carrera/viewcarrera', { curso: curso });
});

router.get('/gestionarcarrera', isLoggedIn, async (req, res) => {
    const links = await pool.query('SELECT * FROM carrera');
    res.render('carrera/gestionarcarrera', { links: links });
});

router.get('/delete/:idCarrera', isLoggedIn, async (req, res) => {
    const { idCarrera } = req.params;
    await pool.query('DELETE FROM carrera WHERE idCarrera = ?', [idCarrera]);
    req.flash('success', 'Carrera Eliminada Correctamente');
    res.redirect('/carrera/gestionarcarrera');
});

router.get('/editcarrera/:idCarrera', isLoggedIn, async (req, res) => {
    const { idCarrera } = req.params;
    const links = await pool.query('SELECT * FROM carrera WHERE idCarrera = ?', [idCarrera])
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
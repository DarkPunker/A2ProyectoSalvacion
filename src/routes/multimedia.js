const express = require('express');
const router = express.Router();
const pool = require('../database');
const { isLoggedIn, isLoggedInUser } = require('../lib/auth');

router.get('/gestionarmultimedia', isLoggedIn, async (req, res) => {
    const carrera = await pool.query('SELECT * FROM Carrera');
    res.render('multimedia/gestionarmultimedia', { carrera });
});

router.get('/gestionarmultimedia/:idCarrera', isLoggedIn, async (req, res) => {
    const { idCarrera } = req.params;
    const carrera = await pool.query('SELECT * FROM Carrera');
    const curso = await pool.query('SELECT * FROM Curso WHERE Curso_idCurso = ?', idCarrera)
    res.render('multimedia/gestionarmultimedia', { carrera, curso });
});

router.get('/gestionarmultimedia/:idCarrera/:idCurso', isLoggedIn, async (req, res) => {
    const { idCarrera, idCurso } = req.params;
    const ids = {
        idCarrera,
        idCurso
    };
    const carrera = await pool.query('SELECT * FROM Carrera');
    const curso = await pool.query('SELECT * FROM Curso WHERE Curso_idCurso = ?', idCarrera);
    const tema = await pool.query('CALL seeTemaCountMultimedia (?)', idCurso);
    res.render('multimedia/gestionarmultimedia', { carrera, curso, tema: tema[0], ids });
});

router.get('/addmultimedia/:idTema', isLoggedIn, async (req, res) => {
    const { idTema } = req.params
    const tema = await pool.query('SELECT * FROM Tema WHERE idTema = ?', idTema);
    const tipomultimedia = await pool.query('SELECT * FROM Tipomultimedia');
    res.render('multimedia/addmultimedia', { tema: tema[0], tipomultimedia });
});

router.post('/addmultimedia/:idTema', isLoggedIn, async (req, res) => {
    const { NombreMultimedia, DescripcionMultimedia, Direccion } = req.body;
    const TipoMultimedia_idTipoMultimedia = parseInt(req.body.selmultimedia);
    const { idTema } = req.params;
    await pool.query('INSERT INTO Multimedia (NombreMultimedia, DescripcionMultimedia, Direccion, Tema_idTema, TipoMultimedia_idTipoMultimedia) VALUE  (?,?,?,?,?)', [NombreMultimedia, DescripcionMultimedia, Direccion, idTema, TipoMultimedia_idTipoMultimedia]);
    req.flash('success', 'Multimedia Guardado Correctamente');
    res.redirect('/multimedia/gestionarmultimedia');
});

router.get('/vermultimedia/:idTema', isLoggedIn, async (req, res) => {
    const { idTema } = req.params;
    const multimedia = await pool.query('SELECT * FROM Tema INNER JOIN Multimedia ON idTema=Tema_idTema WHERE idTema = ?', idTema);
    console.log(multimedia[0]);

    res.render('multimedia/vermultimedia', { multimedia });
});

router.get('/editmultimedia/:idMultimedia', isLoggedIn, async (req, res) => {
    const { idMultimedia } = req.params;
    const multimedia = await pool.query('SELECT * FROM Multimedia WHERE idMultimedia = ?', idMultimedia);
    const tipomultimedia = await pool.query('SELECT * FROM TipoMultimedia');

    res.render('multimedia/editmultimedia', { multimedia: multimedia[0], tipomultimedia });
});

router.post('/editmultimedia/:idMultimedia', isLoggedIn, async (req, res) => {
    const { NombreMultimedia, DescripcionMultimedia, Direccion } = req.body;
    const TipoMultimedia_idTipoMultimedia = parseInt(req.body.selmultimedia);
    const { idMultimedia } = req.params;
    await pool.query('UPDATE Multimedia SET Direccion = ?, WHERE idMultimedia = ?', [null, idMultimedia]);
    await pool.query('UPDATE Multimedia SET NombreMultimedia = ?, DescripcionMultimedia = ?, Direccion = ?, TipoMultimedia_idTipoMultimedia = ? WHERE idMultimedia = ?', [NombreMultimedia, DescripcionMultimedia, Direccion, TipoMultimedia_idTipoMultimedia, idMultimedia]);
    req.flash('success', 'Multimedia Editado Correctamente');
    res.redirect('/multimedia/gestionarmultimedia');
});

module.exports = router;
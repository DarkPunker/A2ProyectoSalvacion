const express = require('express');
const router = express.Router();
const pool = require('../database');
const { isLoggedIn, isLoggedInUser } = require('../lib/auth');

router.get('/gestionarmultimedia', isLoggedIn, async (req, res) => {
    const carrera = await pool.query('SELECT * from carrera');
    res.render('multimedia/gestionarmultimedia', { carrera });
});

router.get('/gestionarmultimedia/:idCarrera', isLoggedIn, async (req, res) => {
    const { idCarrera } = req.params;
    const carrera = await pool.query('SELECT * FROM carrera');
    const curso = await pool.query('SELECT * FROM curso WHERE Curso_idCurso = ?', idCarrera)
    res.render('multimedia/gestionarmultimedia', { carrera, curso });
});

router.get('/gestionarmultimedia/:idCarrera/:idCurso', isLoggedIn, async (req, res) => {
    const { idCarrera, idCurso } = req.params;
    const ids = {
        idCarrera,
        idCurso
    };
    const carrera = await pool.query('SELECT * FROM carrera');
    const curso = await pool.query('SELECT * FROM curso WHERE Curso_idCurso = ?', idCarrera);
    const tema = await pool.query('CALL seeTemaCountMultimedia (?)', idCurso);
    res.render('multimedia/gestionarmultimedia', { carrera, curso, tema: tema[0], ids });
});

router.get('/addmultimedia/:idTema', isLoggedIn, async (req, res) => {
    const { idTema } = req.params
    const tema = await pool.query('SELECT * FROM tema WHERE idTema = ?', idTema);
    const tipomultimedia = await pool.query('SELECT * FROM tipomultimedia');
    res.render('multimedia/addmultimedia', { tema: tema[0], tipomultimedia });
});

router.post('/addmultimedia/:idTema', isLoggedIn, async (req, res) => {
    const { NombreMultimedia, DireccionMultimedia, Direccion } = req.body;
    const TipoMultimedia_idTipoMultimedia = parseInt(req.body.selmultimedia);
    const { idTema } = req.params;
    switch (TipoMultimedia_idTipoMultimedia) {
        case 1:
            await pool.query('INSERT INTO multimedia (NombreMultimedia, DireccionMultimedia, DireccionVideo, Tema_idTema, TipoMultimedia_idTipoMultimedia) VALUE  (?,?,?,?,?)', [NombreMultimedia, DireccionMultimedia, Direccion, idTema, TipoMultimedia_idTipoMultimedia]);
            break;
        case 2:
            await pool.query('INSERT INTO multimedia (NombreMultimedia, DireccionMultimedia, DireccionImagen, Tema_idTema, TipoMultimedia_idTipoMultimedia) VALUE  (?,?,?,?,?)', [NombreMultimedia, DireccionMultimedia, Direccion, idTema, TipoMultimedia_idTipoMultimedia]);
            break;
        case 3:
            await pool.query('INSERT INTO multimedia (NombreMultimedia, DireccionMultimedia, Tema_idTema, TipoMultimedia_idTipoMultimedia) VALUE  (?,?,?,?)', [NombreMultimedia, DireccionMultimedia, idTema, TipoMultimedia_idTipoMultimedia]);
            break;
        case 4:
            await pool.query('INSERT INTO multimedia (NombreMultimedia, DireccionMultimedia, DireccionVIdeo, Tema_idTema, TipoMultimedia_idTipoMultimedia) VALUE  (?,?,?,?,?)', [NombreMultimedia, DireccionMultimedia, Direccion, idTema, TipoMultimedia_idTipoMultimedia]);
            break;
    }
    req.flash('success', 'Multimedia Guardado Correctamente');
    res.redirect('/multimedia/gestionarmultimedia');
});

router.get('/vermultimedia/:idTema', isLoggedIn, async (req, res) => {
    const { idTema } = req.params;
    const multimedia = await pool.query('SELECT * FROM tema INNER JOIN multimedia ON idTema=Tema_idTema WHERE idTema = ?', idTema);
    console.log(multimedia[0]);

    res.render('multimedia/vermultimedia', { multimedia });
});

router.get('/editmultimedia/:idMultimedia', isLoggedIn, async (req, res) => {
    const { idMultimedia } = req.params;
    const multimedia = await pool.query('SELECT * FROM multimedia WHERE idMultimedia = ?', idMultimedia);
    const tipomultimedia = await pool.query('SELECT * FROM tipomultimedia');

    res.render('multimedia/editmultimedia', { multimedia: multimedia[0], tipomultimedia });
});

router.post('/editmultimedia/:idMultimedia', isLoggedIn, async (req, res) => {
    const { NombreMultimedia, DireccionMultimedia, Direccion } = req.body;
    const TipoMultimedia_idTipoMultimedia = parseInt(req.body.selmultimedia);
    const { idMultimedia } = req.params;
    await pool.query('UPDATE multimedia SET DireccionVideo = ?, DireccionImagen = ? WHERE idMultimedia = ?', [null, null, idMultimedia]);
    switch (TipoMultimedia_idTipoMultimedia) {
        case 1:
            await pool.query('UPDATE multimedia SET NombreMultimedia = ?, DireccionMultimedia = ?, DireccionVideo = ?, TipoMultimedia_idTipoMultimedia = ? WHERE idMultimedia = ?', [NombreMultimedia, DireccionMultimedia, Direccion, TipoMultimedia_idTipoMultimedia, idMultimedia]);
            break;
        case 2:
            await pool.query('UPDATE multimedia SET NombreMultimedia = ?, DireccionMultimedia = ?, DireccionImagen = ?, TipoMultimedia_idTipoMultimedia = ? WHERE idMultimedia = ?', [NombreMultimedia, DireccionMultimedia, Direccion, TipoMultimedia_idTipoMultimedia, idMultimedia]);
            break;
        case 3:
            await pool.query('UPDATE multimedia SET NombreMultimedia = ?, DireccionMultimedia = ?, TipoMultimedia_idTipoMultimedia = ? WHERE idMultimedia = ?', [NombreMultimedia, DireccionMultimedia, Direccion, TipoMultimedia_idTipoMultimedia, idMultimedia]);
            break;
        case 4:
            await pool.query('UPDATE multimedia SET NombreMultimedia = ?, DireccionMultimedia = ?, DireccionVideo = ?, TipoMultimedia_idTipoMultimedia = ? WHERE idMultimedia = ?', [NombreMultimedia, DireccionMultimedia, Direccion, TipoMultimedia_idTipoMultimedia, idMultimedia]);
            break;
    }
    req.flash('success', 'Multimedia Editado Correctamente');
    res.redirect('/multimedia/gestionarmultimedia');
});

module.exports = router;
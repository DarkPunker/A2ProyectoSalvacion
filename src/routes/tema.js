const express = require('express');
const router = express.Router();
const pool = require('../database');
const { isLoggedIn, isLoggedInUser } = require('../lib/auth');

router.get('/addtema', isLoggedIn, async (req, res) => {
    const carrera = await pool.query('SELECT * FROM carrera');
    res.render('tema/addtema', { carrera: carrera });
});

router.get('/addtema/:idCarrera', isLoggedIn, async (req, res) => {
    const { idCarrera } = req.params;
    const carrera = await pool.query('SELECT * FROM carrera');
    const curso = await pool.query('SELECT * FROM curso WHERE Curso_idCurso = ?', idCarrera)
    res.render('tema/addtema', { carrera: carrera, curso: curso });
});

router.get('/addtema/:Curso_idCurso/:idCurso', isLoggedIn, async (req, res) => {
    const { Curso_idCurso, idCurso } = req.params;
    const carrera = await pool.query('SELECT * FROM carrera');
    const curso = await pool.query('SELECT * FROM curso WHERE Curso_idCurso = ?', Curso_idCurso);
    const modulo = await pool.query('CALL seeModuloidCarreraidCurso (?)', idCurso);
    res.render('tema/addtema', { carrera, curso, modulo: modulo[0] });
});

router.get('/addtema/:idCarrera/:idCurso/:idModulo', isLoggedIn, async (req, res) => {
    const { idCarrera, idCurso, idModulo } = req.params;
    const carrera = await pool.query('SELECT * FROM carrera');
    const curso = await pool.query('SELECT * FROM curso WHERE Curso_idCurso = ?', idCarrera);
    const modulo = await pool.query('CALL seeModuloidCarreraidCurso (?)', idCurso);
    const unidad = await pool.query('SELECT * FROM unidad WHERE Modulo_idModulo = ?', idModulo);
    res.render('tema/addtema', { carrera, curso, modulo: modulo[0], unidad });
});

router.post('/addtema', isLoggedIn, async (req, res) => {
    const { NombreTema } = req.body;
    const Unidad_idUnidad = parseInt(req.body.selunidad);
    const newTema = {
        NombreTema,
        Unidad_idUnidad
    };
    await pool.query('INSERT INTO tema set ?', [newTema]);
    req.flash('success', 'Tema Guardado Correctamente');
    res.redirect('/tema/gestionartema');
});

router.get('/gestionartema', isLoggedIn, async (req, res) => {
    const links = await pool.query('SELECT * FROM seeAllTemaUnidadModuloCursoCarrera');
    res.render('tema/gestionartema', { links: links });
});

router.get('/edittema/:idTema', isLoggedIn, async (req, res) => {
    const { idTema } = req.params;
    const links = await pool.query('SELECT * FROM tema WHERE idTema = ?', [idTema])
    res.render('tema/edittema', { link: links[0] });
});

router.post('/edittema/:idUnidad', isLoggedIn, async (req, res) => {
    const { idTema } = req.params;
    const { NombreTema } = req.body;
    const newLink = {
        NombreTema,
    };
    await pool.query('UPDATE tema set ? WHERE idTema = ?', [newLink, idTema]);
    req.flash('success', 'Tema Modificado Correctamente');
    res.redirect('/tema/gestionartema');
});

router.get('/gestionarexamen', isLoggedIn, async (req, res) => {
    const carrera = await pool.query('SELECT * from carrera');
    res.render('tema/gestionarexamen', { carrera });
});

router.get('/gestionarexamen/:idCarrera', isLoggedIn, async (req, res) => {
    const { idCarrera } = req.params;
    const carrera = await pool.query('SELECT * FROM carrera');
    const curso = await pool.query('SELECT * FROM curso WHERE Curso_idCurso = ?', idCarrera)
    res.render('tema/gestionarexamen', { carrera, curso });
});

router.get('/gestionarexamen/:idCarrera/:idCurso', isLoggedIn, async (req, res) => {
    const { idCarrera, idCurso } = req.params;
    const ids = {
        idCarrera,
        idCurso
    };
    const carrera = await pool.query('SELECT * FROM carrera');
    const curso = await pool.query('SELECT * FROM curso WHERE Curso_idCurso = ?', idCarrera);
    const tema = await pool.query('CALL seeTemaCountPreguntas (?)', idCurso);
    res.render('tema/gestionarexamen', { carrera, curso, tema: tema[0], ids });
});

router.get('/addpregunta/:idTema', isLoggedIn, async (req, res) => {
    const { idTema } = req.params
    const tema = await pool.query('SELECT * FROM tema WHERE idTema = ?', idTema);
    res.render('tema/addpregunta', { tema: tema[0] });
});

router.get('/verpregunta/:idTema', isLoggedIn, async (req, res) => {
    const { idTema } = req.params;
    const pregunta = await pool.query('CALL seeTemaPreguntasRespuestas (?)', idTema);
    res.render('tema/verpregunta', { pregunta: pregunta[0] });
});

router.get('/editpregunta/:idPregunta', isLoggedIn, async (req, res) => {
    const { idPregunta } = req.params;
    const pregunta = await pool.query('SELECT * FROM pregunta WHERE pregunta.idPregunta = ?', idPregunta);
    const idpregunta = pregunta[0].idPregunta;
    const opcion = await pool.query('SELECT * FROM opcion WHERE opcion.Pregunta_idPregunta = ?', idpregunta);
    res.render('tema/editpregunta', { pregunta: pregunta[0], opcion });
});

router.post('/editpregunta/:idPregunta', isLoggedIn, async (req, res) => {
    const { idPregunta } = req.params;
    const { Pregunta, Enunciado } = req.body;
    const preguntaold = await pool.query('SELECT * FROM opcion WHERE Pregunta_idPregunta = ?', idPregunta);
    await pool.query('UPDATE pregunta SET Pregunta = ? WHERE idPregunta = ?', [Pregunta, idPregunta]);
    for (var i = 0; i < preguntaold.length; i++) {
        await pool.query('UPDATE opcion SET Enunciado = ? WHERE idOpcion = ?', [Enunciado[i], preguntaold[i].idOpcion])
    }
    req.flash('success', 'Pregunta Modificado Correctamente');
    res.redirect('/tema/gestionarexamen');
});

router.post('/addpregunta/:idTema', isLoggedIn, async (req, res) => {
    const { Pregunta, Enunciado, Correcta } = req.body
    const {idTema} = req.params;
    await pool.query('INSERT INTO pregunta (Pregunta, Tema_idTema) VALUE  (?,?)', [Pregunta, idTema]);
    const id = await pool.query('SELECT * FROM pregunta WHERE Pregunta = ?', Pregunta);
    console.log(id);
    
    const idpregunta = id[0].idPregunta;
    for (var i = 1; i <= Enunciado.length; i++) {
        if (Correcta == i) {
            await pool.query('INSERT INTO opcion (Enunciado,Correcta,Pregunta_idPregunta) VALUE (?,?,?)',[Enunciado[i-1],1,idpregunta]);
        }else{
            await pool.query('INSERT INTO opcion (Enunciado,Correcta,Pregunta_idPregunta) VALUE (?,?,?)',[Enunciado[i-1],0,idpregunta]);
        }
    }
    req.flash('success', 'Pregunta Guardada Correctamente');
    res.redirect('/tema/gestionarexamen');
});

module.exports = router;
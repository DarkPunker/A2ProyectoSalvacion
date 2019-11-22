const express = require('express');
const router = express.Router();


const pool = require('../database');
const { isLoggedIn, isLoggedInUser } = require('../lib/auth');

router.get('/exam/:idCurso', isLoggedInUser, async (req, res) => {
    const { idCurso } = req.params;
    const pregunta = await pool.query('CALL seeOpciones (?)', idCurso);
    /* console.log(pregunta[0]); */

    res.render('carrera/exam', { pregunta: pregunta[0] });
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

router.get('/viewcarrera', isLoggedIn, async (req, res) => {
    const carrera = await pool.query('SELECT * FROM carrera');
    res.render('carrera/viewcarrera', { carrera: carrera });
});

router.get('/viewcarrera/:idCarrera', isLoggedIn, async (req, res) => {
    const { idCarrera } = req.params;
    const curso = await pool.query('SELECT * FROM curso WHERE Curso_idCurso = ?', idCarrera);
    res.render('carrera/viewcarrera', { curso: curso });
});

router.get('/addtema', isLoggedIn, async (req, res) => {
    const carrera = await pool.query('SELECT * FROM carrera');
    res.render('carrera/addtema', { carrera: carrera });
});

router.get('/addtema/:idCarrera', isLoggedIn, async (req, res) => {
    const { idCarrera } = req.params;
    const carrera = await pool.query('SELECT * FROM carrera');
    const curso = await pool.query('SELECT * FROM curso WHERE Curso_idCurso = ?', idCarrera)
    res.render('carrera/addtema', { carrera: carrera, curso: curso });
});

router.get('/addtema/:Curso_idCurso/:idCurso', isLoggedIn, async (req, res) => {
    const { Curso_idCurso, idCurso } = req.params;
    const carrera = await pool.query('SELECT * FROM carrera');
    const curso = await pool.query('SELECT * FROM curso WHERE Curso_idCurso = ?', Curso_idCurso);
    const modulo = await pool.query('CALL seeModuloidCarreraidCurso (?)', idCurso);
    res.render('carrera/addtema', { carrera, curso, modulo: modulo[0] });
});

router.get('/addtema/:idCarrera/:idCurso/:idModulo', isLoggedIn, async (req, res) => {
    const { idCarrera, idCurso, idModulo } = req.params;
    const carrera = await pool.query('SELECT * FROM carrera');
    const curso = await pool.query('SELECT * FROM curso WHERE Curso_idCurso = ?', idCarrera);
    const modulo = await pool.query('CALL seeModuloidCarreraidCurso (?)', idCurso);
    const unidad = await pool.query('SELECT * FROM unidad WHERE Modulo_idModulo = ?', idModulo);
    res.render('carrera/addtema', { carrera, curso, modulo: modulo[0], unidad });
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
    res.redirect('/carrera/gestionarcarrera');
});

router.get('/addcurso', isLoggedIn, async (req, res) => {
    const carrera = await pool.query('SELECT * FROM carrera');
    res.render('carrera/addcurso', { carrera: carrera });
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
    res.redirect('/carrera/gestionarcarrera');
});

router.get('/addmodulo', isLoggedIn, async (req, res) => {
    const carrera = await pool.query('SELECT * FROM carrera');
    res.render('carrera/addmodulo', { carrera: carrera });
});

router.get('/addmodulo/:idCarrera', isLoggedIn, async (req, res) => {
    const { idCarrera } = req.params;
    const carrera = await pool.query('SELECT * FROM carrera');
    const curso = await pool.query('SELECT * FROM curso WHERE Curso_idCurso = ?', idCarrera)
    res.render('carrera/addmodulo', { carrera: carrera, curso: curso });
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
    res.redirect('/carrera/gestionarcarrera');
});

router.get('/addunidad', isLoggedIn, async (req, res) => {
    const carrera = await pool.query('SELECT * FROM carrera');
    res.render('carrera/addunidad', { carrera: carrera });
});

router.get('/addunidad/:idCarrera', isLoggedIn, async (req, res) => {
    const { idCarrera } = req.params;
    const carrera = await pool.query('SELECT * FROM carrera');
    const curso = await pool.query('SELECT * FROM curso WHERE Curso_idCurso = ?', idCarrera)
    res.render('carrera/addunidad', { carrera: carrera, curso: curso });
});

router.get('/addunidad/:Curso_idCurso/:idCurso', isLoggedIn, async (req, res) => {
    const { Curso_idCurso, idCurso } = req.params;
    const carrera = await pool.query('SELECT * FROM carrera');
    const curso = await pool.query('SELECT * FROM curso WHERE Curso_idCurso = ?', Curso_idCurso);
    const modulo = await pool.query('CALL seeModulo (?)', idCurso);
    res.render('carrera/addunidad', { carrera, curso, modulo: modulo[0] });
});

router.post('/addunidad', isLoggedIn, async (req, res) => {
    const { NombreUnidad } = req.body;
    const Modulo_idModulo = parseInt(req.body.selmodulo);
    const newUnidad = {
        NombreUnidad,
        Modulo_idModulo
    };
    await pool.query('INSERT INTO unidad set ?', [newUnidad]);
    req.flash('success', 'Unidad Guardado Correctamente');
    res.redirect('/carrera/gestionarcarrera');
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

/* router.get('/editcarrera/:idCarrera', isLoggedIn, async (req, res) => {
    const { idCarrera } = req.params;
    const links = await pool.query('SELECT * FROM carrera WHERE idCarrera = ?', [idCarrera])
    res.render('carrera/editcarrera', { link: links[0] });
}); */

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
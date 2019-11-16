const express = require('express');
const router = express.Router();

const pool = require('../database');

router.get('/addtema', (req,res)=>{
    res.render('links/addtema');
});

router.post('/addtema', async (req,res)=>{
    const {title} = req.body;
    const newLink = {
        title
    };
    await pool.query('INSERT INTO tema set ?', [newLink])
    res.send('enviado');
});

router.get('/list', async(req, res)=>{
    const links = await pool.query('SELECT * FROM carrera');
    res.render('links/list',{links: links});
});

router.get('/delete/:idCarrera', async(req,res)=>{
    const { idCarrera } = req.params;
    await pool.query('DELETE FROM carrera WHERE idCarrera = ?',[idCarrera]);
    req.flash('success','Carrera Eliminada Correctamente');
    res.redirect('/links/list');
});

router.get('/editcarrera/:idCarrera', async(req,res)=>{
    const { idCarrera } = req.params;
    const links = await pool.query('SELECT * FROM carrera WHERE idCarrera = ?',[idCarrera])
    res.render('links/editcarrera', {link: links[0]});
});

router.post('/editcarrera/:idCarrera', async(req,res)=>{
    const {idCarrera} = req.params;
    const {NombreCurso, DescripcionCurso} = req.body;
    const newLink = {
        NombreCurso,
        DescripcionCurso
    };
    await pool.query('UPDATE carrera set ? WHERE idCarrera = ?', [newLink, idCarrera]);
    req.flash('success','Carrera Modificada Correctamente');
    res.redirect('/links/list');
});

router.get('/indexcarrera', async (req,res)=>{
    const links = await pool.query('SELECT * FROM carrera');
    res.render('links/indexcarrera',{links: links});
});

router.get('/addcarrera', (req,res)=>{
    res.render('links/addcarrera');
});

router.post('/addcarrera', async (req,res)=>{
    const {NombreCurso, DescripcionCurso} = req.body;
    const newLink = {
        NombreCurso,
        DescripcionCurso
    };
    await pool.query('INSERT INTO carrera set ?', [newLink])
    req.flash('success','Carrera Guardada Correctamente');
    res.redirect('/links/list');
});

module.exports = router;
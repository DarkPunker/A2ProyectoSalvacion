const express = require('express');
const router = express.Router();
const pool = require('../database');

router.get('/', async(req,res)=>{
    const links = await pool.query('SELECT * FROM carrera INNER JOIN multimedia ON carrera.NombreCurso = multimedia.NombreMultimedia');
   res.render('index', { links: links });
});

module.exports = router;
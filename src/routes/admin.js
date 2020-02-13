const express = require('express');
const router = express.Router();
const pool = require('../database');
const { isLoggedInAdmin } = require('../lib/auth');
const Carousel = require('../models/carousel');

router.get('/gestionarUsuario', isLoggedInAdmin, async (req, res) => {
    const users = await pool.query('SELECT * FROM seeAllUsers');
    res.render('admin/gestionarUsuario', { users });
});

router.get('/editUser/:nombre', isLoggedInAdmin, async (req, res) => {
    const { nombre } = req.params;
    const user = await pool.query('CALL seeUserRol (?)', [nombre]);
    const rol = await pool.query('SELECT * FROM rol');
    res.render('admin/editUser', { user: user[0][0], rol });
});

router.post('/editUser/:nombre', isLoggedInAdmin, async (req, res) => {
    const { nombre } = req.params;
    const { rol, estado } = req.body;
    await pool.query('CALL editUserAdmin (?,?,?)', [nombre, rol, estado]);
    req.flash('success', 'Usuario Modificado Correctamente');
    res.redirect('/admin/gestionarUsuario')
});

router.get('/gestionarCarousel', isLoggedInAdmin, async (req, res) => {
    const carousel = await Carousel.find();
    res.render('admin/gestionarCarousel', { carousel });

});

router.get('/editCarousel/:id', isLoggedInAdmin, async (req, res) => {
    const { id } = req.params;
    const carousel = await Carousel.find({ _id: id });
    res.render('admin/editCarousel', { carousel: carousel[0] })
})

module.exports = router;
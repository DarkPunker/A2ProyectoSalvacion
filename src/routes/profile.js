const express = require('express');
const router = express.Router();
const passport = require('passport');
const pool = require('../database');

const { isLoggedIn, isNotLoggedIn, isLoggedInUser } = require('../lib/auth');


router.get('/profile', isLoggedInUser, async (req, res) => {
    const id = req.user.idUsuario;
    const data = await pool.query('CALL usuarioPersonaTelefono (?)', [id]);
    res.render('profile/profile', { data: data[0] });
});
router.get('/editprofile/:idUsuario', isLoggedInUser, async (req, res) => {
    const { idUsuario } = req.params;
    const data = await pool.query('CALL usuarioPersonaTelefono (?)', [idUsuario]);
    res.render('profile/editprofile', { data: data[0][0] });
});

router.post('/editprofile/:idUsuario', isLoggedIn, async (req, res) => {
    console.log(req.body);
    
    res.send('profile/editprofile');

});

module.exports = router;
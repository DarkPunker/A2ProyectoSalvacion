const express = require('express');
const router = express.Router();
const passport = require('passport');
const pool = require('../database');

const { isLoggedIn, isNotLoggedIn } = require('../lib/auth');

router.get('/signup', isNotLoggedIn, (req, res) => {
    res.render('auth/signup')
});

router.post('/signup', isNotLoggedIn, passport.authenticate('local.signup', {
    successRedirect: '/profile/profile',
    failureRedirect: '/signup',
    failureFlash: true
}));

router.get('/signin', isNotLoggedIn, (req, res) => {
    res.render('auth/signin');
});

router.post('/signin', isNotLoggedIn, (req, res, next) => {
    passport.authenticate('local.signin', {
        successRedirect: '/profile/profile',
        failureRedirect: '/signin',
        failureFlash: true
    })(req, res, next);
});

router.get('/profile/profile', isLoggedIn, async (req, res) => {
    const id = req.user.idUsuario;
    const data = await pool.query('CALL usuarioPersonaTelefono (?)', [id]);
    res.render('profile/profile', { data: data[0]});
});

router.get('/logout', (req, res) => {
    req.logOut();
    res.redirect('/');
});

module.exports = router;
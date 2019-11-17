const passport = require('passport');
const LocalStrategy = require('passport-local').Strategy;
const pool = require('../database');
const helpers = require('../lib/helpers');

passport.use('local.signin', new LocalStrategy({
    usernameField: 'idusuario',
    passwordField: 'contrasena',
    passReqToCallback: true
}, async (req, idusuario, contrasena, done) => {
    const rows = await pool.query('SELECT * FROM usuario WHERE idusuario = ?', [idusuario]);
    if (rows.length > 0) {
        const user = rows[0];
        const valiPassword = await helpers.matchPassword(contrasena, user.Contrasena);
        if (valiPassword) {
            done(null, user, req.flash('success', 'Bienvenido ' + user.idUsuario));
        } else {
            done(null, false, req.flash('message', 'Contraseña invalida'));
        }
    } else {
        return done(null, false, req.flash('message', 'Usuario invalido'));
    }
}));

passport.use('local.signup', new LocalStrategy({
    usernameField: 'idusuario',
    passwordField: 'contrasena',
    passReqToCallback: true
}, async (req, idusuario, contrasena, done) => {
    const { idpersona, nombre1, apellido1, fechanacimiento, sexo } = req.body;
    const { correo } = req.body;
    const newPerson = {
        idpersona,
        nombre1,
        apellido1,
        fechanacimiento,
        sexo
    }
    const newUser = {
        idusuario,
        Persona_cedula: idpersona,
        contrasena,
        correo
    };
    await pool.query('INSERT INTO persona SET ?', [newPerson]);
    newUser.contrasena = await helpers.encyptPassword(contrasena);
    const result = await pool.query('INSERT INTO usuario SET ?', [newUser]);
    done(null, newUser);

}));

passport.serializeUser((user, done) => {
    done(null, user.idUsuario)
});

passport.deserializeUser(async (id, done) => {
    const rows = await pool.query('SELECT * FROM usuario WHERE idusuario = ?', [id]);
    done(null, rows[0]);
});
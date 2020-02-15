const passport = require('passport');
const LocalStrategy = require('passport-local').Strategy;
const pool = require('../database');
const helpers = require('../lib/helpers');

passport.use('local.signin', new LocalStrategy({
    usernameField: 'idusuario',
    passwordField: 'contrasena',
    passReqToCallback: true
}, async (req, idusuario, contrasena, done) => {
    const rows = await pool.query('CALL seeUsuarioForId (?)', idusuario);
    if (rows[0][0].idUsuario == idusuario) {
        const user = rows[0][0];
        const valiPassword = await helpers.matchPassword(contrasena, user.Contrasena);
        if (valiPassword) {
            if (user.EstadoRol != 0) {
                done(null, user, req.flash('success', 'Bienvenido ' + user.idUsuario));    
            } else {
                done(null, false, req.flash('message', 'Usuario inactivo'));    
            }
        } else {
            done(null, false, req.flash('message', 'Contraseña invalida'));
        }
    } else {
         done(null, false, req.flash('message', 'Usuario invalido'));
    }
}));

passport.use('local.signup', new LocalStrategy({
    usernameField: 'idUsuario',
    passwordField: 'contrasena',
    passReqToCallback: true
}, async (req, idUsuario, contrasena, done) => {
    const { idpersona, nombre1, apellido1, fechanacimiento, correo, sexo } = req.body;
    const newPerson = {
        idpersona,
        nombre1,
        apellido1,
        fechanacimiento,
        sexo
    };
    const newUser = {
        idUsuario,
        contrasena,
        correo
    };
    const rows = await pool.query('CALL seeUsuarioForId (?)', [idUsuario]);
    const person = await pool.query('CALL seePersonaForId (?)', [idpersona]);
    if (idpersona.length == 0) {
        done(null, false, req.flash('message', 'Numero de identificacion es un campo obligatorio'));
    } else if (nombre1.length == 0) {
        done(null, false, req.flash('message', 'Primer Nombre es un campo obligatorio'));
    } else if (apellido1.length == 0) {
        done(null, false, req.flash('message', 'Primer apellido es un campo obligatorio'));
    } else if (fechanacimiento.length == 0) {
        done(null, false, req.flash('message', 'Fecha de nacimiento es un campo obligatorio'));
    } else if (rows[0].length > 0) {
        done(null, false, req.flash('message', 'Usuario ya esta en uso'));
    } else if (person[0].length > 0) {
        done(null, false, req.flash('message', 'Numero de identificacion ya esta en uso'));
    } else {
        newUser.contrasena = await helpers.encyptPassword(contrasena);
        /* await pool.query('CALL addPersonaUsuario (?,?,?,?,?,?,?,?)', [newUser.idUsuario, newUser.correo, newUser.contrasena, newPerson.idpersona, newPerson.nombre1, newPerson.apellido1, newPerson.fechanacimiento, newPerson.sexo]); */
        return done(null, newUser);
    }
}));

passport.serializeUser((user, done) => {
    done(null, user.idUsuario)
});

passport.deserializeUser(async (idUsuario, done) => {
    const rows = await pool.query('CALL seeUsuarioForId (?)', [idUsuario]);
    done(null, rows[0][0]);
});
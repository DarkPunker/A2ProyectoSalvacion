module.exports = {
    isLoggedInUser(req, res, next) {
        if ((req.user.Rol_idRol == 1 || req.user.Rol_idRol == 2 || req.user.Rol_idRol == 3) && req.isAuthenticated()) {
            return next();
        }
        return res.redirect('/profile');
    },

    isLoggedIn(req, res, next) {
        if ((req.user.Rol_idRol == 2 || req.user.Rol_idRol == 3) && req.isAuthenticated()) {
            return next();
        }
        return res.redirect('/profile');
    },

    isLoggedInAdmin(req, res, next) {
        if (req.user.Rol_idRol == 2 && req.isAuthenticated()) {
            return next();
        }
        return res.redirect('/profile');
    },

    isNotLoggedIn(req, res, next) {
        if(!req.isAuthenticated()){
            return next();
        }
        return res.redirect('/');
    }
};
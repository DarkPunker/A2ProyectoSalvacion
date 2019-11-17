const bcrypt = require('bcryptjs');
const helpers = {};

helpers.encyptPassword = async (contrasena) => {
    const salt = await bcrypt.genSalt(10);
    const hash = await bcrypt.hash(contrasena, salt);
    return hash;
};

helpers.matchPassword = async (contrasena, savedPassword) => {
    try {
        return await bcrypt.compare(contrasena, savedPassword);
    } catch (e) {
        console.log(e)
    }

};

module.exports = helpers;
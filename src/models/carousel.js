const mongoose = require('mongoose');
const { Schema } = mongoose;

const CarouselSchema = new Schema({
    nombre: { type: String, require: false},
    direccion: { type:String, require: true},
    descripcion: { type: String, require: false},
    estado: {type: Boolean, require: false}
});

module.exports = mongoose.model('carousel', CarouselSchema);
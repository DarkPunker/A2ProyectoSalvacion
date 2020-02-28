module.exports = {
    recortar(pregunta) {
        var resp = pregunta.map(function (item) {

            var respuesta = item.respuestas.split("-");

            var jsonRes = []
            for (var index = 0; index < respuesta.length; index++) {
                var datos = respuesta[index].split(":")
                jsonRes.push({ id: datos[0], respuesta: datos[1] })
            }

            return { ...item, respuestas: jsonRes }
        })
        return resp;
    },
    recortarid(pregunta) {
        var resp = pregunta.map(function (item) {

            var respuesta = item.respuestas.split("-");

            var jsonRes = []
            for (var index = 0; index < respuesta.length; index++) {
                var datos = respuesta[index].split(":")
                jsonRes.push({idSup: datos[0], id: datos[1], respuesta: datos[2] })
            }

            return { ...item, respuestas: jsonRes }
        })
        return resp;
    }
}
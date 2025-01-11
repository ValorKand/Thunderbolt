//validaInicioSesion.js

$(document).ready(function () {
    $(".ui.form").form({
        fields: {
            usuario: {
                identifier: "usuario",
                rules: [
                    {
                        type: "empty",
                        prompt: "Ingresa tu nombre de usuario",
                    },
                ],
            },
            secreto: {
                identifier: "secreto",
                rules: [
                    {
                        type: "empty",
                        prompt: "Ingresa tu contraseña",
                    },
                ],
            },
        },
    });
});

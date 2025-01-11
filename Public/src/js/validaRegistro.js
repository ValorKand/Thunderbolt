//validaRegistro.js

$(document).ready(function () {
    $(".ui.form").form({
        fields: {
            usuario: {
                identifier: "usuario",
                rules: [
                    {
                        type: "empty",
                        prompt: "Ingrese un nombre de usuario",
                    },
                    {
                        type: "regExp",
                        value: /^[a-zA-Z0-9_]{3,20}$/,
                        prompt: "El usuario debe tener entre 3 y 20 caracteres, y solo puede incluir letras, números o guiones bajos",
                    },
                ],
            },
            nombre: {
                identifier: "nombre",
                rules: [
                    {
                        type: "empty",
                        prompt: "Escribe tu nombre",
                    },
                ],
            },
            apellido_paterno: {
                identifier: "apellido_paterno",
                rules: [
                    {
                        type: "empty",
                        prompt: "Escribe tu apellido",
                    },
                ],
            },
            apellido_materno: {
                identifier: "apellido_materno",
                rules: [
                    {
                        type: "empty",
                        prompt: "Escribe tu apellido",
                    },
                ],
            },
            correo: {
                identifier: "correo",
                rules: [
                    {
                        type: "empty",
                        prompt: "Escribe tu correo",
                    },
                    {
                        type: "regExp",
                        value: /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/,
                        prompt: "Escribe un correo válido en el formato correo@dominio.ext",
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
                    {
                        type: "length[8]",
                        prompt: "Tu contraseña debe ser de al menos 8 caracteres",
                    },
                    {
                        type: "regExp",
                        value: /^(?=.*[A-Z])(?=.*[0-9])/,
                        prompt: "La contraseña debe incluir al menos una letra mayúscula y un número",
                    },
                ],
            },
            confirma_secreto: {
                identifier: "confirmar_secreto",
                rules: [
                    {
                        type: "empty",
                        prompt: "Confirma tu contraseña",
                    },
                    {
                        type: "match[secreto]",
                        prompt: "Las contraseñas no coinciden",
                    },
                ],
            },
        },
    });
});

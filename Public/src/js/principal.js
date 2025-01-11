//
//  principal.js
//  Thunderbolt
//
//  Created by David Vales on 03/01/25.
//

$(document).ready(function () {
    // Manejar clics en los enlaces del menú
    $(".ui.right.menu .item").click(function (e) {
        e.preventDefault(); // Evitar que el enlace redirija la página
        const nuevaRuta = $(this).attr("href"); // Obtener la ruta del atributo href
        $("#principal").attr("src", nuevaRuta); // Actualizar el iframe
    });
});

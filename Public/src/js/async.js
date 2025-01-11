//
//  async.js
//  ordenes
//
//  Created by David Vales on 26/12/24.
//

// Función para validar el inicio de sesión
$(document).ready(
    export async function validarLogin(usuario, secreto) {
        try {
            const response = await fetch("/inicioSesion", {
                              method: "POST",
                              headers: { "Content-Type": "application/json" },
                              body: JSON.stringify({ username: usuario, password: secreto }),
                          });

                          if (!response.ok) {
                              const error = await response.json();
                              alert(error.reason || "Contraseña incorrecta"); // Mostrar error
                          } else {
                              alert("Inicio de sesión exitoso");
                              window.location.href = "/principal"; // Redirigir al dashboard
                          }
                      } catch (err) {
                          console.error("Error al validar el inicio de sesión:", err);
                          alert("Hubo un problema con el servidor.");
                      }
                  }

});

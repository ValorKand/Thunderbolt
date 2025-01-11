//ReqUsuario.swift

import Vapor

struct ReqUsuario: Content {
    let usuario: String
    let nombre: String
    let apellido_paterno: String
    let apellido_materno: String?
    let correo: String
    let fecha_nacimiento: String  // Formato: "YYYY-MM-DD"
    let secreto: String
}

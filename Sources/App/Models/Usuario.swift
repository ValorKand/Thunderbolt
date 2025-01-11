//Usuario.swift

import Fluent
import Vapor

final class Usuario: Model, Content {
    static let schema = "usuarios"  // Asegúrate de que el nombre coincida con el de la tabla

    @ID(custom: "id_usuario")
    var id: Int?

    @Field(key: "usuario")
    var usuario: String

    @Field(key: "nombre")
    var nombre: String

    @Field(key: "apellido_paterno")
    var apellido_paterno: String

    @Field(key: "apellido_materno")
    var apellido_materno: String?

    @Field(key: "correo")
    var correo: String

    @Field(key: "fecha_nacimiento")
    var fecha_nacimiento: Date

    @Field(key: "secreto")
    var secreto: String

    init() {}

    init(
        id: Int? = nil,
        usuario: String,
        nombre: String,
        apellido_paterno: String,
        apellido_materno: String? = nil,
        correo: String,
        fecha_nacimiento: Date,
        secreto: String
    ) {
        self.id = id
        self.usuario = usuario
        self.nombre = nombre
        self.apellido_paterno = apellido_paterno
        self.apellido_materno = apellido_materno
        self.correo = correo
        self.fecha_nacimiento = fecha_nacimiento
        self.secreto = secreto
    }
}

//routes.swift

import Fluent
import Vapor

func routes(_ app: Application) throws {
    app.get { req async throws in
        try await req.view.render("index", ["title": "Vales Corp – Sistema de Ordenes de Servicio"])
    }

    app.get("hello") { req async -> String in
        "Hello, world!"
    }

    //Página nueva orden de servicio
    app.get("ordenesDeServicio") { req async throws in
        try await req.view.render("ordenesDeServicio", ["title": "Nuevo Orden de Servicio"])
    }

    //Página registro usuario
    app.get("registroUsuario") { req async throws in
        try await req.view.render("registroUsuario", ["title": "Nuevo usuario"])
    }

    //Página principal despues de iniciar sesión
    app.get("principal") { req async throws in
        try await req.view.render("principal", ["title": "Inicio"])
    }

    try app.register(collection: TodoController())

    //Función para inicio de sesión
    app.post("inicioSesion", use: controlLogin)

    //Función para validar conexión a base de datos
    app.get("checaBD", use: VerificaPSQL().checaBD(req:))

    //Función registrar usuario
    app.post("registrarUsuario") { req -> EventLoopFuture<HTTPStatus> in
        // Decodificar los datos recibidos en la solicitud
        let registro = try req.content.decode(ReqUsuario.self)

        // Encriptar la contraseña (secreto)
        let secretoEncriptado = try Bcrypt.hash(registro.secreto)

        // Crear un nuevo usuario con los datos recibidos y la contraseña encriptada
        let usuario = Usuario(
            usuario: registro.usuario,
            nombre: registro.nombre,
            apellido_paterno: registro.apellido_paterno,
            apellido_materno: registro.apellido_materno,
            correo: registro.correo,
            fecha_nacimiento: DateFormatter.yyyyMMdd.date(from: registro.fecha_nacimiento)
                ?? Date(),
            secreto: secretoEncriptado  // Aquí guardas la contraseña encriptada
        )

        // Guardar el usuario en la base de datos
        return usuario.save(on: req.db).map {
            return .created  // Retorna un estado HTTP 201 (Creado)
        }
    }
}

//ControlLogin.swift

import Vapor
import Fluent

func controlLogin(req: Request) async throws -> Response {
    // Decodificar la solicitud
    let reqLogin = try req.content.decode(ReqLogin.self)

    // Buscar al usuario en la base de datos
    guard let usuario = try await Usuario.query(on: req.db)
        .filter(\.$usuario == reqLogin.usuario)
        .first()
    else {
        throw Abort(.notFound, reason: "Usuario no encontrado")
        print("alert('Usuario no encontrado :c')")
    }

    // Verificar la contraseña
    let secretoValido = try Bcrypt.verify(reqLogin.secreto, created: usuario.secreto)
    guard secretoValido else {
        throw Abort(.unauthorized, reason: "Contraseña incorrecta")
        print("alert('Contraseña incorrecta')")
    }

    // Generar un token
    let simbolo = try GenerarSimbolo.generarSimbolo(for: usuario)

    // Retornar una respuesta con el token
    // Configura la sesión
    req.session.data["usuarioID"] = String(usuario.id ?? 0)
    
    // Responder al cliente dependiendo del tipo de solicitud
    if req.headers.contentType == .json {
        // Responder con JSON para AJAX
        return Response(status: .ok, body: .init(string: "{\"status\":\"ok\", \"redirect\":\"/principal\"}"))
    }
    // Redirige al dashboard
    return req.redirect(to: "/principal")
}

//GenerarSimbolo.swift

import JWTKit
import Vapor

struct GenerarSimbolo {
    // Función para generar el token
    static func generarSimbolo(for user: Usuario) throws -> String {
        struct Payload: JWTPayload {
            let idUsuario: Int
            let exp: Date

            func verify(using signer: JWTSigner) throws {
                guard exp > Date() else {
                    throw Abort(.unauthorized, reason: "Token expirado")
                }
            }
        }

        let payload = Payload(idUsuario: user.id!, exp: Date().addingTimeInterval(3600))
        let signer = JWTSigner.hs256(key: "super-secret-key")
        return try signer.sign(payload)
    }
}

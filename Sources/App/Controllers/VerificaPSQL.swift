//
//  VerificaPSQL.swift
//  ordenes
//
//  Created by David Vales on 28/12/24.
//

import Vapor
import Fluent
import FluentSQL

struct VerificaPSQL {
    func checaBD(req: Request) -> EventLoopFuture<String> {
        // Convertir `req.db` a SQLDatabase para ejecutar consultas raw
        guard let sql = req.db as? SQLDatabase else {
            return req.eventLoop.makeSucceededFuture("No se pudo acceder a PostgreSQL.")
        }
        return sql.raw("SELECT 1").all().map { _ in
            "Conexión a la base de datos exitosa."
        }.flatMapError { error in
            req.eventLoop.makeSucceededFuture("Error de conexión: \(error.localizedDescription)")
        }
    }
}

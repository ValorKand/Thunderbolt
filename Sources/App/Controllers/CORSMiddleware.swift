//
//  CORSMiddleware.swift
//  ordenes
//
//  Created by David Vales on 26/12/24.
//


import Vapor

struct CORSMiddleware: Middleware {
    func respond(to request: Request, chainingTo next: Responder) -> EventLoopFuture<Response> {
        // Ajusta los orígenes permitidos según tus necesidades
        let allowedOrigins = ["http://127.0.0.1:8080/"] // Reemplaza con tu dominio

        request.headers.add(name: "Access-Control-Allow-Origin", value: allowedOrigins.joined(separator: ", "))
        request.headers.add(name: "Access-Control-Allow-Methods", value: "GET, POST, PUT, DELETE, OPTIONS")
        request.headers.add(name: "Access-Control-Allow-Headers", value: "Origin, Content-Type, Accept, Authorization")

        if request.method == .OPTIONS {
            return request.eventLoop.future(Response())
        } else {
            return next.respond(to: request)
        }
    }
}

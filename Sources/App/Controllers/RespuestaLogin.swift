//
//  RespuestaLogin.swift
//  ordenes
//
//  Created by David Vales on 23/12/24.
//

import Vapor

struct RespuestaLogin: Content {
    let mensaje: String
    let token: String
}

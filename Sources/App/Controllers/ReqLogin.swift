//ReqLogin.swift

import Vapor

struct ReqLogin: Content {
    let usuario: String
    let secreto: String
}

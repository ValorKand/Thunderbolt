import NIOSSL
import Fluent
import FluentPostgresDriver
import Leaf
import Vapor

// configures your application
public func configure(_ app: Application) async throws {
    // uncomment to serve files from /Public folder
    app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))
    app.middleware.use(app.sessions.middleware)
    app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))
    app.middleware.use(CORSMiddleware())

    app.databases.use(DatabaseConfigurationFactory.postgres(configuration: .init(
        hostname: Environment.get("DATABASE_HOST") ?? "localhost",
        port: Environment.get("DATABASE_PORT").flatMap(Int.init(_:)) ?? SQLPostgresConfiguration.ianaPortNumber,
        username: Environment.get("DATABASE_USERNAME") ?? "davidvales",
        password: Environment.get("DATABASE_PASSWORD") ?? "",
        database: Environment.get("DATABASE_NAME") ?? "ordenes",
        tls: .prefer(try .init(configuration: .clientDefault)))
    ), as: .psql)

    app.sessions.configuration.cookieFactory = { sessionID in
        var cookie = HTTPCookies.Value(string: sessionID.string)
        cookie.sameSite = .none  // Permite que las cookies se usen en iframes
        cookie.isSecure = true   // Requiere HTTPS para enviar la cookie
        return cookie
    }

    app.migrations.add(CreateTodo())

    app.views.use(.leaf)

    // register routes
    try routes(app)
}

public func semantic(_ app: Application) async throws {

}

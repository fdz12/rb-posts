public enum NetworkStatusCode: Int {
    case badRequest = 400
    case unathorized = 401
    case forbidden = 403
    case notFound = 404
    case methodNotAllowed = 405
    case conflict = 409
    case internalServerError = 500
    case unknown = 0
}

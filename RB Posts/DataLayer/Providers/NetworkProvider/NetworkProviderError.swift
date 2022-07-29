public enum NetworkProviderError: Error {
    case requestFailed(statusCode: NetworkStatusCode, message: String)
}

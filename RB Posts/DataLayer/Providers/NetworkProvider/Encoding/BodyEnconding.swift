//
//  BodyEnconding.swift
//  RB Posts
//
//  Created by Denis Žuffa on 26/07/2022.
//

import Foundation

public struct BodyEncoding: ParameterEncoding {
    
    // MARK: Properties

    /// Returns a `JSONEncoding` instance with default writing options.
    public static var `default`: BodyEncoding { BodyEncoding() }

    // MARK: Initialization

    public init() {}

    // MARK: Encoding

    public func encode(_ urlRequest: URLRequest, with parameters: [String: Any]) throws -> URLRequest {
        var urlRequest = urlRequest

        urlRequest.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        urlRequest.httpBody = getPostString(params: parameters).data(using: .utf8)

        return urlRequest
    }
    
    private func getPostString(params: [String:Any]) -> String
    {
        var data = [String]()
        for(key, value) in params
        {
            data.append(key + "=\(value)")
        }
        return data.map { String($0) }.joined(separator: "&")
    }
}

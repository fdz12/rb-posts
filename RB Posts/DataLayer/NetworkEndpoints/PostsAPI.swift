//
//  PostsAPI.swift
//  RB Posts
//
//  Created by Denis Žuffa on 29/07/2022.
//

import Foundation

enum PostsAPI {
    case list
    case add(_ data: [String: Any])
}

extension PostsAPI: NetworkEndpoint {
    var baseURL: URL { URL(string: "https://jsonplaceholder.typicode.com")! }
    var path: String {
        switch self {
        case .list, .add:
            return "/posts"
        }
    }
    var method: NetworkMethod {
        switch self {
        case .list:
            return .get
        case .add:
            return .post
        }
    }
    var headers: [String: String]? {
        nil
    }
    var task: NetworkTask {
        switch self {
        case .list:
            return .requestParameters(parameters: [:], encoding: URLEncoding.default)
        case let .add(data):
            return .requestParameters(parameters: data, encoding: JSONEncoding.default)
        }
    }
}

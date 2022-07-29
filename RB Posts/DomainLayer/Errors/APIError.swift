//
//  APIError.swift
//  RB Posts
//
//  Created by Denis Žuffa on 29/07/2022.
//

import Foundation

public enum APIError: Error, Equatable {
    case api(Api)
    
    public enum Api {
        case failed
    }
}

extension APIError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .api(let reason):
            switch reason {
            case .failed: return "Adding post failed. Please, check your internet connection or try again."
            }
        }
    }
}

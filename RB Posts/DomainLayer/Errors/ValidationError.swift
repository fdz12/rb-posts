//
//  ValidationError.swift
//  RB Posts
//
//  Created by Denis Žuffa on 29/07/2022.
//

import Foundation

public enum ValidationError: Error, Equatable {
    case title(Title)
    case bodyStr(BodyStr)
    
    public enum Title {
        case isEmpty
    }
    
    public enum BodyStr {
        case isEmpty
    }
}

extension ValidationError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .title(let reason):
            switch reason {
            case .isEmpty: return "Invalid or empty title"
            }
        case .bodyStr(let reason):
            switch reason {
            case .isEmpty: return "Invalid or empty body"
            }
        }
    }
}

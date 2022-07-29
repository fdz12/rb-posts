//
//  Data+Extensions.swift
//  RB Posts
//
//  Created by Denis Žuffa on 26/07/2022.
//

import Foundation

public extension Data {
    func map<D: Decodable>(_ type: D.Type, atKeyPath keyPath: String? = nil) throws -> D {
        if let keyPath = keyPath {
            let toplevel = try JSONSerialization.jsonObject(with: self)
            if let nestedJson = (toplevel as AnyObject).value(forKeyPath: keyPath) {
                let nestedJsonData = try JSONSerialization.data(withJSONObject: nestedJson)
                return try JSONDecoder().decode(D.self, from: nestedJsonData)
            } else {
                throw DecodingError.dataCorrupted(.init(
                    codingPath: [],
                    debugDescription: "Nested JSON not found for key path \"\(keyPath)\"")
                )
            }
        } else {
            return try JSONDecoder().decode(D.self, from: self)
        }
    }
}

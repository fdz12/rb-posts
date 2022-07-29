//
//  Encodable+Extensions.swift
//  RB Posts
//
//  Created by Denis Žuffa on 26/07/2022.
//

import Foundation

public extension Encodable {
    func encode() throws -> [String: Any] {
        let data = try JSONEncoder().encode(self)
        guard let json = try JSONSerialization.jsonObject(with: data) as? [String: Any] else {
            throw EncodingError.invalidValue(data, .init(codingPath: [], debugDescription: "Object can't be encoded"))
        }
        return json
    }
}

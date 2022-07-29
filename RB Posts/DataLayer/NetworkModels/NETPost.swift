//
//  NETPost.swift
//  RB Posts
//
//  Created by Denis Žuffa on 29/07/2022.
//

struct NETPost: Decodable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

// Conversion from NetworkModel to DomainModel
extension NETPost {
    var domainModel: Post {
        Post(
            title: title,
            body: body
        )
    }
}

// Conversion from DomainModel to NetworkModel
extension Post {
    var networkModel: NETPost {
        NETPost(
            userId: 1,
            id: 100,
            title: title,
            body: body
        )
    }
}

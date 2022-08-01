//
//  PostsRepository.swift
//  RB Posts
//
//  Created by Denis Žuffa on 29/07/2022.
//

import Foundation

public protocol PostsRepository {
    func list() async throws -> [Post]
    func add(post: Post) async throws -> Post?
}

//
//  PostsRepositoryImpl.swift
//  RB Posts
//
//  Created by Denis Žuffa on 29/07/2022.
//

import Foundation

public struct PostsRepositoryImpl: PostsRepository {
    
    private let network: NetworkProvider
    
    public init(
        networkProvider: NetworkProvider
    ) {
        network = networkProvider
    }
    
    public func list() async throws -> [Post] {
        let endpoint = PostsAPI.list
        let posts = try await network.request(endpoint).map([NETPost].self).map { $0.domainModel }
        return posts
    }
    
    public func add(post: Post) async throws -> Post? {
        return Post(title: "", body: "")
    }
}


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
        do {
            let dataNetwork = try post.networkModel.encode()
            _ = try await network.request(PostsAPI.add(dataNetwork), withInterceptor: false)
            return post
        } catch {
            throw APIError.api(.failed)
        }
    }
}


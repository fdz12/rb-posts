//
//  Repositories+Injection.swift
//  RB Posts
//
//  Created by Denis Žuffa on 29/07/2022.
//

import Resolver

public extension Resolver {
    static func registerRepositories() {
        register { PostsRepositoryImpl(networkProvider: resolve()) as PostsRepository }
    }
}

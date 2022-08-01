//
//  GetPostsUseCase.swift
//  RB Posts
//
//  Created by Denis Žuffa on 29/07/2022.
//

public protocol GetPostsUseCase {
    func execute() async throws -> [Post]
}

public struct GetPostsUseCaseImpl: GetPostsUseCase {
    public func execute() async throws -> [Post] {
        try await postsRepository.list()
    }
    
    private let postsRepository: PostsRepository
    
    public init(postsRepository: PostsRepository) {
        self.postsRepository = postsRepository
    }
}

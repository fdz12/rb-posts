//
//  AddPostUseCase.swift
//  RB Posts
//
//  Created by Denis Žuffa on 29/07/2022.
//

public protocol AddPostUseCase {
    func execute(_ data: Post) async throws
}

public struct AddPostUseCaseImpl: AddPostUseCase {
    
    private let postsRepository: PostsRepository
    private let validateTitleUseCase: ValidateTitleUseCase
    private let validateBodyUseCase: ValidateBodyUseCase
    
    public init(
        postsRepository: PostsRepository,
        validateTitleUseCase: ValidateTitleUseCase,
        validateBodyUseCase: ValidateBodyUseCase
    ) {
        self.postsRepository = postsRepository
        self.validateTitleUseCase = validateTitleUseCase
        self.validateBodyUseCase = validateBodyUseCase
    }
    
    public func execute(_ data: Post) async throws {
        do {
            try validateTitleUseCase.execute(data.title)
            try validateBodyUseCase.execute(data.body)
            _ = try await postsRepository.add(post: data)
        } catch {
            throw APIError.api(.failed)
        }
    }
}

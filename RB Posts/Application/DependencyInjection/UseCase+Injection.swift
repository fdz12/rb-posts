//
//  UseCase+Injection.swift
//  RB Posts
//
//  Created by Denis Žuffa on 29/07/2022.
//

import Resolver

public extension Resolver {
    static func registerUseCases() {
        register { GetPostsUseCaseImpl(postsRepository: resolve()) as GetPostsUseCase }
        
        register { AddPostUseCaseImpl(postsRepository: resolve(), validateTitleUseCase: resolve(), validateBodyUseCase: resolve()) as AddPostUseCase }
        
        register { ValidateTitleUseCaseImpl() as ValidateTitleUseCase }
        register { ValidateBodyUseCaseImpl() as ValidateBodyUseCase }
    }
}

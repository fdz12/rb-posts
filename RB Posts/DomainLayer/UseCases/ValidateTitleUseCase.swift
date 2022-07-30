//
//  ValidateTitleUseCase.swift
//  RB Posts
//
//  Created by Denis Žuffa on 29/07/2022.
//

public protocol ValidateTitleUseCase {
    func execute(_ title: String) throws
}

public struct ValidateTitleUseCaseImpl: ValidateTitleUseCase {
    
    public init() {}
    
    public func execute(_ title: String) throws {
        print(title.isEmpty)
        print(title)
        if title.isEmpty {
            throw ValidationError.title(.isEmpty)
        }
    }
}

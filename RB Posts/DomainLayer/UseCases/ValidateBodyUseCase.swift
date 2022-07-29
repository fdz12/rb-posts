//
//  ValidateSubtitleUseCase.swift
//  RB Posts
//
//  Created by Denis Žuffa on 29/07/2022.
//

public protocol ValidateBodyUseCase {
    func execute(_ bodyStr: String) throws
}

public struct ValidateBodyUseCaseImpl: ValidateBodyUseCase {
    
    public init() {}
    
    public func execute(_ bodyStr: String) throws {
        if bodyStr.isEmpty {
            throw ValidationError.bodyStr(.isEmpty)
        }
    }
}

//
//  ViewModel.swift
//  RB Posts
//
//  Created by Denis Žuffa on 29/07/2022.
//

@MainActor
public protocol ViewModel {
    // Lifecycle
    func onAppear()
    func onDisappear()
    
    // State
    associatedtype State
    var state: State { get }
    
    // Intent
    associatedtype Intent
    func onIntent(_ intent: Intent)
}

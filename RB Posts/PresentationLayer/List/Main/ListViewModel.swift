//
//  ListViewModel.swift
//  RB Posts
//
//  Created by Denis Žuffa on 29/07/2022.
//

import Resolver
import SwiftUI

final class ListViewModel: BaseViewModel, ViewModel, ObservableObject {
    
    private weak var flowController: FlowController?
    
    @Injected private(set) var getPostsUseCase : GetPostsUseCase
        
    init(flowController: FlowController?) {
        self.flowController = flowController
        super.init()
    }
    
    override func onAppear() {
        super.onAppear()
        executeTask(Task { await loadPosts() })
    }
    
    @Published private(set) var state: State = State()

    struct State {
        let text = "Posts"
        var posts: [Post?] = []
    }
    
    enum Intent {
    }
    
    func onIntent(_ intent: Intent) {
    }
    
    private func loadPosts() async {
        do {
            state.posts = try await getPostsUseCase.execute()
        } catch {
            state.posts = [Post(title: "List of posts failed to load", body: "Check your internet connection")]
        }
    }
}

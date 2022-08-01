//
//  DetailView.swift
//  RB Posts
//
//  Created by Denis Žuffa on 30/07/2022.
//

import Resolver
import SwiftUI

final class DetailViewModel: BaseViewModel, ViewModel, ObservableObject {
    
    private var post: Post
    private weak var flowController: FlowController?
        
    init(post: Post, flowController: FlowController?) {
        self.post = post
        self.flowController = flowController
        super.init()
    }
    
    override func onAppear() {
        super.onAppear()
        executeTask(Task { await loadDetail() })
    }
    
    @Published private(set) var state: State = State()
    
    struct State {
        var post: Post?
    }
    
    enum Intent {
    }
    
    func onIntent(_ intent: Intent) {
    }
    
    private func loadDetail() async {
        state.post = post
    }
}

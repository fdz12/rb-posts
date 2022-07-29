//
//  DetailViewModel.swift
//  RB Posts
//
//  Created by Denis Žuffa on 29/07/2022.
//

import Resolver
import SwiftUI

final class DetailViewModel: BaseViewModel, ViewModel, ObservableObject {
    
    private weak var flowController: FlowController?
        
    init(flowController: FlowController?) {
        self.flowController = flowController
        super.init()
    }
    
    override func onAppear() {
        super.onAppear()
    }
    
    @Published private(set) var state: State = State()

    struct State {
        let text = "Hello world!"
    }
    
    enum Intent {
    }
    
    func onIntent(_ intent: Intent) {
    }
}

//
//  AddViewModel.swift
//  RB Posts
//
//  Created by Denis Žuffa on 29/07/2022.
//

import Resolver
import SwiftUI

final class AddViewModel: BaseViewModel, ViewModel, ObservableObject {
    
    private weak var flowController: FlowController?
    
    @Injected private(set) var addPostUseCase: AddPostUseCase
    
    init(flowController: FlowController?) {
        self.flowController = flowController
        super.init()
    }
    
    override func onAppear() {
        super.onAppear()
    }
    
    @Published private(set) var state: State = State()
    
    struct State {
        var title: String = ""
        var body: String = ""
        var buttonLoading: Bool = false
        var alert: AlertData?
    }
    
    enum Intent {
        case changeTitle(String)
        case changeBody(String)
        case send
        case dismissAlert
    }
    
    func onIntent(_ intent: Intent) {
        executeTask(Task {
            switch intent {
            case .changeTitle(let title): changeTitle(title)
            case .changeBody(let body): changeBody(body)
            case .send: await send()
            case .dismissAlert: dismissAlert()
            }
        })
    }
    
    private func changeTitle(_ title: String) {
        state.title = title
    }
    
    private func changeBody(_ body: String) {
        state.body = body
    }
    
    private func send() async {
       do {
           state.buttonLoading = true
           let data = Post(title: state.title, body: state.body)
           try await addPostUseCase.execute(data)
           state.buttonLoading = false
           state.alert = .init(title: "Successfully added!")
           state.title = ""
           state.body = ""
       } catch {
           state.buttonLoading = false
           state.alert = .init(title: error.localizedDescription)
       }
   }
    
    private func dismissAlert() {
        state.alert = nil
    }
    
}

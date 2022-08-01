//
//  ListFlowController.swift
//  RB Posts
//
//  Created by Denis Žuffa on 29/07/2022.
//

import SwiftUI
import UIKit

enum ListFlow: Flow, Equatable {
    case list(List)

    enum List: Equatable {
        case showDetail(_ post: Post)
    }
}

public final class ListFlowController: FlowController {
        
    override public func setup() -> UIViewController {
        let vm = ListViewModel(flowController: self)
        return BaseHostingController(rootView: ListView(viewModel: vm))
    }
    
    override public func handleFlow(_ flow: Flow) {
       guard let listFlow = flow as? ListFlow else { return }
       switch listFlow {
       case .list(let listFlow): handleListFlow(listFlow)
       }
   }
}

extension ListFlowController {
    func handleListFlow(_ flow: ListFlow.List) {
        switch flow {
        case let .showDetail(post): showDetail(post)
        }
    }
    
    private func showDetail(_ post: Post) {
        let vm = DetailViewModel(post: post, flowController: self)
        let vc = BaseHostingController(rootView: DetailView(viewModel: vm))
        navigationController.show(vc, sender: nil)
    }
}

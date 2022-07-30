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
    }
}

public final class ListFlowController: FlowController {
        
    override public func setup() -> UIViewController {
        let vm = ListViewModel(flowController: self)
        return BaseHostingController(rootView: ListView(viewModel: vm))
    }
}

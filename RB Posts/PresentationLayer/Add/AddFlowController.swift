//
//  AddFlowController.swift
//  RB Posts
//
//  Created by Denis Žuffa on 29/07/2022.
//

import SwiftUI
import UIKit

enum AddFlow: Flow, Equatable {
    case add(Add)

    enum Add: Equatable {
    }
}

public final class AddFlowController: FlowController {
        
    override public func setup() -> UIViewController {
        let vm = AddViewModel(flowController: self)
        return BaseHostingController(rootView: AddView(viewModel: vm))
    }
}

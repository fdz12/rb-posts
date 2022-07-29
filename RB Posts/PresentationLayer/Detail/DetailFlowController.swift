//
//  DetailFlowController.swift
//  RB Posts
//
//  Created by Denis Žuffa on 29/07/2022.
//

import SwiftUI
import UIKit

enum DetailFlow: Flow, Equatable {
    case detail(Detail)

    enum Detail: Equatable {
    }
}

public final class DetailFlowController: FlowController {
        
    override public func setup() -> UIViewController {
        let vm = DetailViewModel(flowController: self)
        return BaseHostingController(rootView: DetailView(viewModel: vm))
    }
}

//
//  AppFlowController.swift
//  RB Posts
//
//  Created by Denis Žuffa on 29/07/2022.
//

import Resolver
import UIKit


final class AppFlowController: FlowController, MainFlowControllerDelegate {
        
    func start() {
        setupMain()
    }
    
    func setupMain() {
        let fc = MainFlowController(navigationController: navigationController)
        fc.delegate = self
        let rootVC = startChildFlow(fc)
        navigationController.viewControllers = [rootVC]
    }
    
    func presentOnboarding(animated: Bool, completion: (() -> Void)?) {
        let fc = MainFlowController(navigationController: navigationController)
        fc.delegate = self
        let rootVC = startChildFlow(fc)
        navigationController.viewControllers = [rootVC]
    }
}

//
//  MainFlowController.swift
//  RB Posts
//
//  Created by Denis Žuffa on 29/07/2022.
//

import UIKit

enum MainTab: Int {
    case detail = 1
}

protocol MainFlowControllerDelegate: AnyObject {
    func presentOnboarding(animated: Bool, completion: (() -> Void)?)
}

final class MainFlowController: FlowController {
    
    weak var delegate: MainFlowControllerDelegate?
    
    override func setup() -> UIViewController {
        let main = UITabBarController()
        main.viewControllers = [setupFirstTab()]
        return main
    }
    
    private func setupFirstTab() -> UINavigationController {
        let detailNC = BaseNavigationController()
        detailNC.tabBarItem = UITabBarItem(
            title: "Hello",
            image: UIImage(systemName: "person.fill"),
            tag: MainTab.detail.rawValue
        )
        let detailFC = DetailFlowController(navigationController: detailNC)
        let detailRootVC = startChildFlow(detailFC)
        detailNC.viewControllers = [detailRootVC]
        return detailNC
    }
    
    func presentOnboarding() {
        delegate?.presentOnboarding(animated: true, completion: { [weak self] in
            self?.navigationController.viewControllers = []
            self?.stopFlow()
        })
    }
    
    @discardableResult private func switchTab(_ index: MainTab) -> FlowController? {
        guard let tabController = rootViewController as? UITabBarController,
            let tabs = tabController.viewControllers, index.rawValue < tabs.count else { return nil }
        tabController.selectedIndex = index.rawValue
        return childControllers[index.rawValue]
    }
}

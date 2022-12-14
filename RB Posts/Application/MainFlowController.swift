//
//  MainFlowController.swift
//  RB Posts
//
//  Created by Denis Žuffa on 29/07/2022.
//

import UIKit

enum MainTab: Int {
    case list = 1
}

protocol MainFlowControllerDelegate: AnyObject {
    func presentOnboarding(animated: Bool, completion: (() -> Void)?)
}

final class MainFlowController: FlowController {
    
    weak var delegate: MainFlowControllerDelegate?
    
    override func setup() -> UIViewController {
        let main = UITabBarController()
        main.viewControllers = [setupFirstTab(), setupAddTab()]
        return main
    }
    
    private func setupFirstTab() -> UINavigationController {
        let listNC = BaseNavigationController()
        listNC.tabBarItem = UITabBarItem(
            title: "Posts",
            image: UIImage(systemName: "note.text"),
            tag: MainTab.list.rawValue
        )
        let listFC = ListFlowController(navigationController: listNC)
        let listRootVC = startChildFlow(listFC)
        listNC.viewControllers = [listRootVC]
        return listNC
    }
    
    private func setupAddTab() -> UINavigationController {
        let addNC = BaseNavigationController()
        addNC.tabBarItem = UITabBarItem(
            title: "Add Post",
            image: UIImage(systemName: "note.text.badge.plus"),
            tag: MainTab.list.rawValue
        )
        let addFC = AddFlowController(navigationController: addNC)
        let addRootVC = startChildFlow(addFC)
        addNC.viewControllers = [addRootVC]
        return addNC
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

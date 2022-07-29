//
//  UIViewController+Extensions.swift
//  RB Posts
//
//  Created by Denis Žuffa on 29/07/2022.
//

import UIKit

extension UIViewController {

    func add(_ child: UIViewController) {
        addChild(child)
        view.addSubview(child.view)
        child.didMove(toParent: self)
    }
}

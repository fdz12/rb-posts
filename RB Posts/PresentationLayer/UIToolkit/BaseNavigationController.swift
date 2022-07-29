//
//  BaseNavigationController.swift
//  RB Posts
//
//  Created by Denis Žuffa on 29/07/2022.
//

import UIKit

public final class BaseNavigationController: UINavigationController {
    
    private var statusBarStyle: UIStatusBarStyle = .default
    
    public convenience init() {
        self.init(nibName: nil, bundle: nil)
    }
    
    override public var preferredStatusBarStyle: UIStatusBarStyle {
        return statusBarStyle
    }
}

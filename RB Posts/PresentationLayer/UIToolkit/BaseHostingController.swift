//
//  BaseHostingController.swift
//  RB Posts
//
//  Created by Denis Žuffa on 29/07/2022.
//

import OSLog
import SwiftUI

public class BaseHostingController<Content>: UIHostingController<Content> where Content: View {
    
    private let logger: Logger = Logger()
    
    override public init(rootView: Content) {
        super.init(rootView: rootView)
        logger.info("\(type(of: self)) initialized")
        setupUI()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        logger.info("\(type(of: self)) initialized")
        setupUI()
    }
    
    deinit {
        logger.info("\(type(of: self)) deinitialized")
    }
    
    private func setupUI() {
        // Setup background color and back button title
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)
    }
}

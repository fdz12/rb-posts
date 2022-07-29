//
//  Providers+Injection.swift
//  RB Posts
//
//  Created by Denis Žuffa on 29/07/2022.
//

import Resolver
import UIKit

public extension Resolver {
    
    static func registerProviders(
        application: UIApplication,
        appDelegate: UIApplicationDelegate,
        networkProviderDelegate: NetworkProviderDelegate
    ) {
        register {
            SystemNetworkProvider(
                delegate: networkProviderDelegate
            ) as NetworkProvider
        }
    }
}

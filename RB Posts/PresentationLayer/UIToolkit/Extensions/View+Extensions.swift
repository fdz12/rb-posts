//
//  View+Extensions.swift
//  RB Posts
//
//  Created by Denis Žuffa on 29/07/2022.
//

import SwiftUI

@MainActor
public extension View {
    @inlinable func lifecycle(_ viewModel: BaseViewModel) -> some View {
        self
            .onAppear {
                viewModel.onAppear()
            }
            .onDisappear {
                viewModel.onDisappear()
            }
    }
}

//
//  DetailView.swift
//  RB Posts
//
//  Created by Denis Žuffa on 29/07/2022.
//

import SwiftUI

struct DetailView: View {
    
    @ObservedObject private var viewModel: DetailViewModel
    
    init(viewModel: DetailViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            Text(viewModel.state.text)
                .font(.title)
                .padding(.bottom, 5)
        }.lifecycle(viewModel)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        let vm = DetailViewModel(flowController: nil)
        DetailView(viewModel: vm)
    }
}

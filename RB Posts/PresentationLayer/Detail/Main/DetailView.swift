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
        List {
            VStack (alignment: .leading) {
                Text("Title")
                    .font(.headline)
                Text("Subtitle")
                    .font(.subheadline)
            }
            VStack (alignment: .leading) {
                Text("Title")
                    .font(.headline)
                Text("Subtitle")
                    .font(.subheadline)
            }
            VStack (alignment: .leading) {
                Text("Title")
                    .font(.headline)
                Text("Subtitle")
                    .font(.subheadline)
            }
        }
        .lifecycle(viewModel)
        .navigationTitle(viewModel.state.text)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        let vm = DetailViewModel(flowController: nil)
        DetailView(viewModel: vm)
    }
}

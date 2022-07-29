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
        if (viewModel.state.posts.isEmpty) {
            HStack {
                ProgressView().padding(.trailing, 5)
                Text("Loading...")
            }
        }
        List {
            ForEach(viewModel.state.posts, id: \.self) { post in
                VStack (alignment: .leading) {
                    Text(post?.title ?? "")
                        .font(.headline)
                        .truncationMode(.tail)
                        .lineLimit(1)
                    Text(post?.body ?? "")
                        .font(.subheadline)
                        .truncationMode(.tail)
                        .lineLimit(3)
                }
                
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

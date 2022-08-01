//
//  DetailView.swift
//  RB Posts
//
//  Created by Denis Žuffa on 30/07/2022.
//

import SwiftUI

struct DetailView: View {
    
    @ObservedObject private var viewModel: DetailViewModel
    
    init(viewModel: DetailViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ZStack {
            VStack {
                VStack {
                    Text(viewModel.state.post?.title ?? "No title")
                        .font(.title2)
                        .padding(.bottom, 30)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text(viewModel.state.post?.body ?? "No body")
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(10)
            }
            .background(Color(UIColor.systemBackground))
            .cornerRadius(10)
            .padding(20)
        }
        .lifecycle(viewModel)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .background(Color(UIColor.systemGray5))
        .navigationTitle("Detail")
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        let vm = DetailViewModel(post: Post(title: "", body: ""), flowController: nil)
        DetailView(viewModel: vm)
    }
}

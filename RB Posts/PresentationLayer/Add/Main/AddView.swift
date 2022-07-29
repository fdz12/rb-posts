//
//  AddView.swift
//  RB Posts
//
//  Created by Denis Žuffa on 29/07/2022.
//

import SwiftUI

struct AddView: View {
    
    @ObservedObject private var viewModel: AddViewModel
    
    init(viewModel: AddViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        return VStack {
               VStack(alignment: .center, spacing: 16) {
                   TextFields(
                       name: "Add post",
                       title: viewModel.state.title,
                       bodyStr: viewModel.state.body,
                       onTitleChange: { title in viewModel.onIntent(.changeTitle(title)) },
                       onBodyChange: { bodyStr in viewModel.onIntent(.changeBody(bodyStr)) }
                   )
               HStack {
                   if (viewModel.state.buttonLoading) {
                       ProgressView().padding(.trailing, 20)
                   }
                   Button("Add") {
                       viewModel.onIntent(.send)
                   }.buttonStyle(.bordered)
                   .disabled(viewModel.state.buttonLoading)
               }
           }.padding()
           .textFieldStyle(.roundedBorder)
       }.alert(item: Binding<AlertData?>(
           get: { viewModel.state.alert },
           set: { _ in viewModel.onIntent(.dismissAlert) }
       )) { alert in .init(alert) }
       .lifecycle(viewModel)
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        let vm = AddViewModel(flowController: nil)
        AddView(viewModel: vm)
    }
}

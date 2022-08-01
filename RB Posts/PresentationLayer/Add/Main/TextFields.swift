//
//  TextFields.swift
//  RB Posts
//
//  Created by Denis Žuffa on 29/07/2022.
//

import SwiftUI

struct TextFields: View {
    
    private let name: String
    private let title: String
    private let bodyStr: String
    private let onTitleChange: (String) -> Void
    private let onBodyChange: (String) -> Void
    
    init(
        name: String,
        title: String,
        bodyStr: String,
        onTitleChange: @escaping (String) -> Void,
        onBodyChange: @escaping (String) -> Void
    ) {
        self.name = name
        self.title = title
        self.bodyStr = bodyStr
        self.onTitleChange = onTitleChange
        self.onBodyChange = onBodyChange
    }
    
    var body: some View {
        VStack {
            Text(name)
                .font(.title)
                .padding(.top, 30)
            
            TextField(
                "Title",
                text: Binding<String>(
                    get: { title },
                    set: { title in onTitleChange(title) }
                )
            )
            
            ZStack(alignment: .top) {
                if bodyStr.isEmpty {
                    Text("Body")
                        .foregroundColor(Color(red: 0.741, green: 0.741, blue: 0.749))
                        .multilineTextAlignment(.leading)
                        .padding([.top, .leading], 8)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                
                TextEditor(
                    text: Binding<String>(
                        get: { bodyStr },
                        set: { bodyStr in onBodyChange(bodyStr) }
                    )
                )
                .opacity(bodyStr.isEmpty ? 0.25 : 1)
                .multilineTextAlignment(.leading)
                .overlay(RoundedRectangle(cornerRadius: 5)
                .stroke(Color.secondary).opacity(0.2))
            }
        }
    }
}

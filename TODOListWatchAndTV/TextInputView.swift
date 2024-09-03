//
//  TextInputView.swift
//  TODOListWatchAndTV
//
//  Created by Никита Гуляев on 03.09.2024.
//

import SwiftUI

struct TextInputView: View {
    @Binding var newTodo: String
    var onCommit: () -> Void
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            TextField("Enter new task", text: $newTodo)
                .padding()
                .background(.gray)
                .cornerRadius(10)
                .padding()

            Button("Done") {
                onCommit()
                presentationMode.wrappedValue.dismiss()
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 10)
    }
}


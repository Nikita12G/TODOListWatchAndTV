//
//  TodoListView.swift
//  TODOListWatchAndTV
//
//  Created by Никита Гуляев on 03.09.2024.
//

import SwiftUI

struct TodoListView: View {
    @State private var todos: [String] = []
    @State private var newTodo: String = ""
    @State private var isPresentingInput = false

    var body: some View {
        NavigationView {
            VStack {
                Button(action: {
                    isPresentingInput = true
                }) {
                    Text("Add New Task")
                }.buttonStyle(.borderedProminent)
                    .sheet(isPresented: $isPresentingInput) {
                        TextInputView(newTodo: $newTodo, onCommit: addTodo)
                    }.padding()
                
                VStack(alignment: .leading) {
                    Text("Tasks list")
                        .padding()
                    List {
                        ForEach(todos, id: \.self) { todo in
                            Text(todo)
                        }
                        .onDelete(perform: deleteTodo)
                    }
                }
            }
            .navigationTitle("TODO List")
        }
    }

    private func addTodo() {
        guard !newTodo.isEmpty else { return }
        todos.append(newTodo)
        newTodo = ""
        isPresentingInput = false
    }

    private func deleteTodo(at offsets: IndexSet) {
        todos.remove(atOffsets: offsets)
    }
}

#Preview {
    TodoListView()
}

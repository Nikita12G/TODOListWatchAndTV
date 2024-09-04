//
//  TODOListWidget.swift
//  TODOListWidget
//
//  Created by Никита Гуляев on 04.09.2024.
//

import WidgetKit
import SwiftUI

struct TodoItem: Identifiable, Codable {
    let id: UUID
    let task: String
}

struct TodoProvider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), todos: sampleTodos)
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> Void) {
        let entry = SimpleEntry(date: Date(), todos: sampleTodos)
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> Void) {
        let entries = [SimpleEntry(date: Date(), todos: loadTodos())]
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
    
    private func loadTodos() -> [TodoItem] {
        return sampleTodos
    }
}

let sampleTodos = [
    TodoItem(id: UUID(), task: "Buy milk"),
    TodoItem(id: UUID(), task: "Walk the dog"),
    TodoItem(id: UUID(), task: "Do laundry")
]

struct SimpleEntry: TimelineEntry {
    let date: Date
    let todos: [TodoItem]
}

struct TodoListWidgetEntryView : View {
    var entry: TodoProvider.Entry

    var body: some View {
        VStack(alignment: .leading) {
            Text("TODO List")
                .font(.headline)
                .padding(.bottom, 2)

            ForEach(entry.todos.prefix(3)) { todo in
                Text(todo.task)
                    .font(.body)
                    .padding(.bottom, 1)
            }
        }
        .padding()
    }
}

struct TodoListWidget: Widget {
    let kind: String = "TodoListWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: TodoProvider()) { entry in
            TodoListWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My TODO List")
        .description("Keep track of your tasks.")
        .supportedFamilies([.systemSmall, .systemMedium, .systemLarge])
    }
}

struct TodoListWidget_Previews: PreviewProvider {
    static var previews: some View {
        TodoListWidgetEntryView(entry: SimpleEntry(date: Date(), todos: sampleTodos))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}

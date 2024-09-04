//
//  TODOListWidgetBundle.swift
//  TODOListWidget
//
//  Created by Никита Гуляев on 04.09.2024.
//

import WidgetKit
import SwiftUI

@main
struct TODOListWidgetBundle: WidgetBundle {
    var body: some Widget {
        TodoListWidget()
        TODOListWidgetLiveActivity()
    }
}

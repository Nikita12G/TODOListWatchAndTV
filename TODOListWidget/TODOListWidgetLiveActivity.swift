//
//  TODOListWidgetLiveActivity.swift
//  TODOListWidget
//
//  Created by Никита Гуляев on 04.09.2024.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct TODOListWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct TODOListWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: TODOListWidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension TODOListWidgetAttributes {
    fileprivate static var preview: TODOListWidgetAttributes {
        TODOListWidgetAttributes(name: "World")
    }
}

extension TODOListWidgetAttributes.ContentState {
    fileprivate static var smiley: TODOListWidgetAttributes.ContentState {
        TODOListWidgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: TODOListWidgetAttributes.ContentState {
         TODOListWidgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: TODOListWidgetAttributes.preview) {
   TODOListWidgetLiveActivity()
} contentStates: {
    TODOListWidgetAttributes.ContentState.smiley
    TODOListWidgetAttributes.ContentState.starEyes
}

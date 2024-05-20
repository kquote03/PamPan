//
//  pampan.swift
//  pampan
//
//  Created by Sarra on 19/05/2024.
//

import WidgetKit
import SwiftUI

private let widgetGroupId = "group.pampan"
struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), title: "Placeholder title", description: "Placeholder description")
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let data = UserDefaults.init(suiteName: widgetGroupId)
        let entry = SimpleEntry(date: Date(), title: data?.string(forKey: "title") ?? "No Title Set", description: data?.string(forKey: "description" ) ?? "No Message set")
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
    
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, title: "Example title", description: "Example message")
            entries.append(entry)
        }
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let title: String
    let description: String
}

struct pampanEntryView : View {
    var entry: Provider.Entry
    
    var body: some View {
        VStack{
            Text(entry.date, style: .time)
            Text(entry.title)
            Text(entry.description)
        }
    }
    
}

struct pampan: Widget {
    let kind: String = "pampan"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            pampanEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct pampan_Previews: PreviewProvider {
    static var previews: some View {
        pampanEntryView(entry: SimpleEntry(date: Date(), title: "Example title", description: "Example message"))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}

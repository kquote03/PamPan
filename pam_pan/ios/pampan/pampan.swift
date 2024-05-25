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
        SimpleEntry(date: Date(), title: "Placeholder title", description: "Placeholder description", filename:"No screenshot available")
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let data = UserDefaults.init(suiteName: widgetGroupId)
        let filename = data?.string(forKey: "filename") ?? "No screenshot available"
        let entry = SimpleEntry(date: Date(), title: data?.string(forKey: "title") ?? "No Title Set", description: data?.string(forKey: "description" ) ?? "No Message set",filename: filename)
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
    
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, title: "Example title", description: "Example message", filename: "image")
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
    let filename: String
}

struct pampanEntryView : View {
    var entry: Provider.Entry
    var ImageWidget: some View {
        if let uiImage = UIImage(contentsOfFile: entry.filename){
            let image = Image(uiImage: uiImage)
            return AnyView(image)
        }
        print ("the image file coule not be loaded")
        return AnyView(EmptyView())
    }
    var body: some View {
        VStack{
            ImageWidget
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
        pampanEntryView(entry: SimpleEntry(date: Date(), title: "Example title", description: "Example message", filename: "filename"))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}

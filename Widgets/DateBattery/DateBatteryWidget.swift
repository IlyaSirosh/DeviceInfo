//
//  DateBatteryWidget.swift
//  DeviceInfo
//
//  Created by Illya Sirosh on 03.02.2021.
//

import WidgetKit
import SwiftUI
import UIKit

struct ColorfulDateBatteryWidget: Widget {
    let kind = "colorful-date-battery-widget"
    let backgroundImageName: String
    
    init() {
        self.backgroundImageName = "colorfulGradientBackground"
    }
    
    var body: some WidgetConfiguration {
        StaticConfiguration(
            kind: kind,
            provider: DateBatteryProvider()) { entry  in
            DateBatteryWidgetView(info: entry.info, backgroundImageName: "colorfulGradientBackground")
        }
        .supportedFamilies([.systemSmall, .systemMedium, .systemLarge])
    }
}

struct DateBatteryProvider: TimelineProvider {
    init(){
        UIDevice.current.isBatteryMonitoringEnabled = true
    }
    
    func placeholder(in context: Context) -> DateBatteryEntry {
        createEntry(batteryLevel: 0.12)
    }
    
    func getSnapshot(in context: Context, completion: @escaping (DateBatteryEntry) -> Void) {
        let entry: DateBatteryEntry
        if context.isPreview {
            entry = createEntry(batteryLevel: 0.12)
        } else {
            entry = createEntry()
        }
        
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<DateBatteryEntry>) -> Void) {
        let date = Date()
        let entry = createEntry(for: date)
        
        // Create a date that's 15 minutes in the future.
        let nextUpdateDate = Calendar.current.date(byAdding: .minute, value: 1, to: date)!

        
        // Create the timeline with the entry and a reload policy with the date
        // for the next update.
        let timeline = Timeline(
            entries:[entry],
            policy: .after(nextUpdateDate)
        )
        
        completion(timeline)
    }
    
    private func createEntry(for date: Date = Date(), batteryLevel: Float? = nil) -> DateBatteryEntry {
        let currentBatteryLevel = batteryLevel ?? UIDevice.current.batteryLevel
        let info = DateBatteryData(date: date, batteryLevel: currentBatteryLevel)
        return DateBatteryEntry(date: Date(), info: info)
    }
}


struct DateBatteryEntry: TimelineEntry {
    var date: Date
    var info: DateBatteryData
}


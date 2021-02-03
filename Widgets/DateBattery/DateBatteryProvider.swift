//
//  DateBatteryProvider.swift
//  WidgetsExtension
//
//  Created by Illya Sirosh on 03.02.2021.
//

import WidgetKit
import UIKit

struct DateBatteryProvider: TimelineProvider {
    var batteryService: BatteryService
    
    
    func placeholder(in context: Context) -> DateBatteryEntry {
        createEntry(batteryLevel: batteryService.levelPlaceholder)
    }
    
    func getSnapshot(in context: Context, completion: @escaping (DateBatteryEntry) -> Void) {
        let entry: DateBatteryEntry
        if context.isPreview {
            entry = createEntry(batteryLevel: batteryService.levelPlaceholder)
        } else {
            entry = createEntry()
        }
        
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<DateBatteryEntry>) -> Void) {
        let date = Date()
        let entry = createEntry(for: date)
        
        let nextUpdateDate = Calendar.current.date(byAdding: .minute, value: 5, to: date)!

    
        let timeline = Timeline(
            entries:[entry],
            policy: .after(nextUpdateDate)
        )
        
        completion(timeline)
    }
    
    private func createEntry(for date: Date = Date(), batteryLevel: Int? = nil) -> DateBatteryEntry {
        let currentLevel = batteryLevel ?? batteryService.currentLevel
        let info = DateBatteryData(date: date, batteryLevel: currentLevel)
        return DateBatteryEntry(date: Date(), info: info)
    }
}


struct DateBatteryEntry: TimelineEntry {
    var date: Date
    var info: DateBatteryData
}


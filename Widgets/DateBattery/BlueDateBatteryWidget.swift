//
//  BlueDateBatteryWidget.swift
//  WidgetsExtension
//
//  Created by Illya Sirosh on 03.02.2021.
//

import WidgetKit
import SwiftUI

struct BlueDateBatteryWidget: Widget {
    let kind = "blue-date-battery-widget"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(
            kind: kind,
            provider: DateBatteryProvider(batteryService: BatteryService())) { entry  in
            DateBatteryWidgetView(info: entry.info, backgroundImageName: "blueGradientBackground")
        }
        .configurationDisplayName("Device info")
        .description("See current time and battery level")
        .supportedFamilies([.systemSmall, .systemMedium, .systemLarge])
    }
}


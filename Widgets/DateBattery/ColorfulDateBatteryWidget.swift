//
//  DateBatteryWidget.swift
//  DeviceInfo
//
//  Created by Illya Sirosh on 03.02.2021.
//

import WidgetKit
import SwiftUI


struct ColorfulDateBatteryWidget: Widget {
    let kind = "colorful-date-battery-widget"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(
            kind: kind,
            provider: DateBatteryProvider(batteryService: BatteryService())) { entry  in
            DateBatteryWidgetView(info: entry.info, backgroundImageName: "colorfulGradientBackground")
        }
        .configurationDisplayName("Device info")
        .description("See current time and battery level")
        .supportedFamilies([.systemSmall, .systemMedium, .systemLarge])
    }
}

//
//  DateBatteryView.swift
//  DeviceInfo
//
//  Created by Illya Sirosh on 03.02.2021.
//

import SwiftUI
import WidgetKit

struct DateBatteryWidgetView: View {
    @Environment(\.widgetFamily) var family: WidgetFamily
    let info: DateBatteryData
    let backgroundImageName: String
    
    var body: some View {
        DateBatteryView(info, family: family, backgroundImageName: backgroundImageName)
    }
}

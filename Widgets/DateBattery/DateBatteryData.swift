//
//  DateBatteryInfo.swift
//  DeviceInfo
//
//  Created by Illya Sirosh on 03.02.2021.
//

import Foundation

struct DateBatteryData {
    let date: Date
    let batteryLevel: Int
    
    static let example = DateBatteryData(date: Date(), batteryLevel: 73)
}

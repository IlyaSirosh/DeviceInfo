//
//  BatteryService.swift
//  WidgetsExtension
//
//  Created by Illya Sirosh on 03.02.2021.
//

import UIKit

struct BatteryService {
    
    init() {
        UIDevice.current.isBatteryMonitoringEnabled = true
    }

    var currentLevel: Float {
        let level = UIDevice.current.batteryLevel
        return level > 0 ? level : levelPlaceholder
    }
    
    let levelPlaceholder: Float = 0
}

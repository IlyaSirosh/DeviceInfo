//
//  BatteryService.swift
//  WidgetsExtension
//
//  Created by Illya Sirosh on 03.02.2021.
//

import UIKit
import DeviceKit

struct BatteryService {
    
    var currentLevel: Int {
        let level = Device.current.batteryLevel
        return  level ?? levelPlaceholder
    }
    
    let levelPlaceholder: Int = 0
}

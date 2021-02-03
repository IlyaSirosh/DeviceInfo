//
//  Widgets.swift
//  Widgets
//
//  Created by Illya Sirosh on 03.02.2021.
//

import WidgetKit
import SwiftUI

@main
struct Widgets: WidgetBundle {

    @WidgetBundleBuilder
    var body: some Widget {
        ColorfulDateBatteryWidget()
        BlueDateBatteryWidget()
    }
}

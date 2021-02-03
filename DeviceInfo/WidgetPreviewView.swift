//
//  WidgetPreviewView.swift
//  DeviceInfo
//
//  Created by Illya Sirosh on 03.02.2021.
//

import SwiftUI
import WidgetKit

struct WidgetPreviewView<Content: View>: View {
    let family: WidgetFamily
    let content: () -> Content
    var containerSize: CGSize
    var widgetSize: CGSize
    
    init(_ containerSize: CGSize, family: WidgetFamily, content: @escaping () -> Content) {
        self.family = family
        self.content = content
        self.containerSize = containerSize
        self.widgetSize = Self.frame(for: containerSize, family: family)
    }
    
    var body: some View {
        content()
            .frame(width: widgetSize.width, height: widgetSize.height)
            .cornerRadius(15)
    }
    
    private static func frame(for size: CGSize, family: WidgetFamily) -> CGSize {
        let padding:CGFloat = 15
        let width = size.width - 2*padding
        
        switch family {
        case .systemSmall:
            return CGSize(width: width / 2, height: width / 2)
        case .systemMedium:
            return CGSize(width: width, height: width / 2)
        case .systemLarge:
            return CGSize(width: width, height: width)
        @unknown default:
            return CGSize(width: width / 2, height: width / 2)
        }
    }
    
}

//
//  DateBatteryView.swift
//  DeviceInfo
//
//  Created by Illya Sirosh on 03.02.2021.
//

import SwiftUI
import WidgetKit

struct DateBatteryView: View {
    private let labels: DateLabels
    private let info: DateBatteryData
    private let imageName: String
    
    var family: WidgetFamily
    
    init(_ info: DateBatteryData, family: WidgetFamily, backgroundImageName: String) {
        self.info = info
        self.labels = DateLabels(date: info.date)
        self.family = family
        self.imageName = backgroundImageName
    }
    
    var body: some View {
        GeometryReader { geometry in
            body(for: geometry.size)
        }
    }
    
    private func body(for size: CGSize) -> some View {
        ZStack {
            timeView()
                .padding()
                .opacity(0.6)
            
            VStack {
                adaptiveStack {
                    Text(labels.date)
                        .font(.system(size: size.height / 9, weight: .bold, design: .rounded))
                    Spacer()
                    Battery(level: info.batteryLevel)
                }
                Spacer()
                HStack {
                    Text(labels.weekday)
                        .font(.custom("Courgette-Regular", size: size.height / 6))
                        .fontWeight(.light)
                    Spacer()
                }
            }.padding()
            
        }
        .foregroundColor(.white)
        .background(
            Image(imageName)
                .resizable()
        )
        
    }
    
    @ViewBuilder
    private func adaptiveStack<Content: View>( @ViewBuilder _ content: @escaping () -> Content) -> some View {
        switch family {
        case .systemSmall:
            HStack {
                VStack(alignment: .leading, content: content)
                Spacer()
            }
        default:
            HStack(content: content)
        }
    }
    
    @ViewBuilder
    private func timeView() -> some View {
        switch family {
        case .systemMedium:
            TimeView(hours: labels.hour, minutes: labels.minute)
                .frame(maxHeight: .infinity)
        default:
            VTimeView(hours: labels.hour, minutes: labels.minute)
        }
    }

}

extension DateBatteryView {
    struct DateLabels {
        let hour: String
        let minute: String
        let date: String
        let weekday: String
        
        init(date: Date) {
            let calendar = Calendar.current
            let components = calendar.dateComponents([.month, .day, .weekday, .hour, .minute], from: date)
            
            self.hour = String(format: "%02d", components.hour!)
            self.minute = String(format: "%02d", components.minute!)
            let day = components.day!
            let month = calendar.monthSymbols[components.month! - 1]
            self.date = "\(day) \(month)"
            self.weekday = calendar.weekdaySymbols[day - 1]
        }
    }
}

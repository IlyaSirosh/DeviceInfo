//
//  ContentView.swift
//  DeviceInfo
//
//  Created by Illya Sirosh on 03.02.2021.
//

import SwiftUI
import WidgetKit

struct ContentView: View {
    let placeholderData: DateBatteryData
    init() {
        placeholderData = DateBatteryData(date: Date(), batteryLevel: 0.73)
    }
    
    var body: some View {
        GeometryReader { geometry in
            
            VStack {
                title("Widgets")
                    .font(.largeTitle)
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .center, spacing: 15) {
                        
                        title("Small")
                            .font(.largeTitle)
                        HStack {
                            WidgetPreviewView( geometry.size, family: .systemSmall) {
                                DateBatteryView(placeholderData, family: .systemSmall, backgroundImageName: "colorfulGradientBackground")
                            }
                            
                            WidgetPreviewView( geometry.size, family: .systemSmall) {
                                DateBatteryView(placeholderData, family: .systemSmall, backgroundImageName: "blueGradientBackground")
                            }
                        }
                        
                        title("Medium")
                            .font(.title)
                        WidgetPreviewView( geometry.size, family: .systemMedium) {
                            DateBatteryView(placeholderData, family: .systemMedium, backgroundImageName: "colorfulGradientBackground")
                        }
                        
                        WidgetPreviewView( geometry.size, family: .systemMedium) {
                            DateBatteryView(placeholderData, family: .systemMedium, backgroundImageName: "blueGradientBackground")
                        }
                        
                        title("Large")
                            .font(.title)
                        WidgetPreviewView( geometry.size, family: .systemLarge) {
                            DateBatteryView(placeholderData, family: .systemLarge, backgroundImageName: "colorfulGradientBackground")
                        }
                        WidgetPreviewView( geometry.size, family: .systemLarge) {
                            DateBatteryView(placeholderData, family: .systemLarge, backgroundImageName: "blueGradientBackground")
                        }
                       
                    }
                }.frame(maxWidth: .infinity)
                
            }
            
        }
    }
    
    private func title(_ value: String) -> some View {
        HStack {
            Text(value)
                .padding(.horizontal)
                .padding(.top, 30)
            Spacer()
        }

    }
    

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

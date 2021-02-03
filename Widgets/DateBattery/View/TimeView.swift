//
//  TimeView.swift
//  DeviceInfo
//
//  Created by Illya Sirosh on 03.02.2021.
//

import SwiftUI

struct TimeView: View {
    let hours: String
    let minutes: String

    
    var body: some View {
        GeometryReader { geometry in
 
            HStack(alignment: .center) {
                Text("\(hours):\(minutes)")
                    .font(.system(size: geometry.size.height * 0.75, weight: .bold, design: .rounded))
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
        }

    }
}

struct TimeView_Previews: PreviewProvider {
    static var previews: some View {
        TimeView(hours: "01", minutes: "23")
            .frame(width: 400, height: 200)
            .background(Color.blue)
    }
}

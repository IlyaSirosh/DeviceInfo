//
//  VTimeView.swift
//  DeviceInfo
//
//  Created by Illya Sirosh on 03.02.2021.
//

import SwiftUI

struct VTimeView: View {
    let hours: String
    let minutes: String

    
    var body: some View {
        GeometryReader { geometry in
            HStack {
                Spacer()
                VStack(alignment: .trailing) {
                    Text(hours)
                        .frame(height: geometry.size.height / 2)
                    Text(minutes)
                        .frame(height: geometry.size.height / 2)
                }
                .font(.system(size: geometry.size.height / 2 + geometry.size.height*0.07, weight: .bold, design: .rounded))
            }
            
        }

    }
}

struct VTimeView_Previews: PreviewProvider {
    static var previews: some View {
        VTimeView(hours: "01", minutes: "23")
            .frame(width: 300, height: 400)
            .background(Color.blue)
    }
}

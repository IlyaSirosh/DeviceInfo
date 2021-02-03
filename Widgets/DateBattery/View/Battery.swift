//
//  Battery.swift
//  DeviceInfo
//
//  Created by Illya Sirosh on 03.02.2021.
//

import SwiftUI

struct Battery: View {
    private let levelLabel: String
    
    init(level: Int) {
        self.levelLabel =  "\(level)%"
    }
    
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 40, height: 22)
                .cornerRadius(6)
            Rectangle()
                .frame(width: 5, height: 11)
                .cornerRadius(2)
                .offset(x: 21, y: 0)
            Text(levelLabel)
                .font(.system(size: 12, weight: .bold, design: .rounded))
                .foregroundColor(.gray)
        }.foregroundColor(.white)
 
    }
    
}

struct Battery_Previews: PreviewProvider {
    static var previews: some View {
        Battery(level: 20)
            .background(Color.blue)
    }
}

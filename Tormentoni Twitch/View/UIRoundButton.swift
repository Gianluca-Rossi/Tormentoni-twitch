//
//  UIRoundButton.swift
//  Tormentoni Twitch
//
//  Created by Gianluca Rossi on 26/08/2020.
//  Copyright © 2020 Gianluca Rossi. All rights reserved.
//

import SwiftUI

struct UIRoundButton: View {
    
    let label: String
    
    var body: some View {
        ZStack {
            Circle()
            .frame(width: 46, height: 46)
            .foregroundColor(Color(UIColor(red: 0.05, green: 0.05, blue: 0.06, alpha: 1.00)))
            .background(Color(UIColor(red: 0.05, green: 0.05, blue: 0.06, alpha: 1.00)))
            .clipShape(Circle())
            .offset(x: 0, y: 3)
            
            
            Circle()
            .frame(width: 46, height: 46)
            .foregroundColor(Color(UIColor(red: 0.23, green: 0.23, blue: 0.24, alpha: 1.00)))
            .background(Color(UIColor(red: 0.23, green: 0.23, blue: 0.24, alpha: 1.00)))
            .clipShape(Circle())
            
            Text(label)
                .fontWeight(Font.Weight.bold)
                .font(.custom("Noteworthy", size: 30.0))
            .foregroundColor(Color(UIColor(red: 0.94, green: 0.94, blue: 0.95, alpha: 1.00)))
        }
        .buttonStyle(PlainButtonStyle())
    }
}

#if DEBUG
struct UIRoundButton_Previews: PreviewProvider {
    static var previews: some View {
        HStack{
        UIRoundButton(label: "<")
        UIRoundButton(label: ">")
        }
    }
}
#endif

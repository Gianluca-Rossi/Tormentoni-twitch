//
//  Headerv2.swift
//  Tormentoni Twitch
//
//  Created by Gianluca Rossi on 05/09/2020.
//  Copyright © 2020 Gianluca Rossi. All rights reserved.
//

import SwiftUI

struct Headerv2: View {
    var streamerArray: [Streamer]
    var index: Int
    var body: some View {
        ZStack(alignment: .top) {
            Text(streamerArray[index].name.uppercased())
                .font(.custom("Abyss", size: 50.0))
                .foregroundColor((Color(UIColor(red: 0.05, green: 0.05, blue: 0.06, alpha: 1.00))))
                .lineLimit(1)
                .padding(.top, 60)
                .minimumScaleFactor(0.01)
            
            Text(streamerArray[index].name.uppercased())
                .font(.custom("Abyss", size: 50.0))
                .offset(x: 0, y: -6).foregroundColor(Color(UIColor(red: 1.00, green: 0.77, blue: 0.00, alpha: 1.00)))
                .lineLimit(1)
                .padding(.top, 60)
                .minimumScaleFactor(0.01)
            
            Spacer()
            
            Button(action: {
                print("\(mockStreamerArray2[self.index].name)")
            }) {
                ZStack(alignment: .top){
                    Circle()
                        .frame(width: 204, height: 204, alignment: .top)
                        .padding(.top, 37)
                        .foregroundColor(Color(UIColor(red: 0.47, green: 0.17, blue: 0.91, alpha: 1.00)))
                    
                    Image(uiImage: mockStreamerArray2[index].avatar)
                        .resizable().scaledToFill()
                        .frame(width: 168, height: 200, alignment: .top)
                }
                    .padding(.top, 150) // remove
            }
        }.frame(minWidth: 0,
                maxWidth: .infinity,
                minHeight: 420,
                maxHeight: 420,
                alignment: .top)
            .background(backgroundColor)
    }
}

#if DEBUG
struct Headerv2_Previews: PreviewProvider {
    static var previews: some View {
        Headerv2(streamerArray: mockStreamerArray2, index: 0)
    }
}
#endif

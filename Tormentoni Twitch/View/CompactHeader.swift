//
//  CompactHeader.swift
//  Tormentoni Twitch
//
//  Created by Gianluca Rossi on 26/08/2020.
//  Copyright © 2020 Gianluca Rossi. All rights reserved.
//

import SwiftUI

struct CompactHeader: View {
    
    let nome: String
    let avatar: UIImage
    
    var body: some View {
        ZStack(alignment: .bottom) {
            
            
            ZStack(alignment: .bottom) {
            HStack(alignment: .bottom, spacing: 0, content: {
                UIRoundButton(label: "<")
                    .padding(.leading, 16)
                        .padding(.bottom, 27
                    )
                    ZStack{
                Text(nome.uppercased())
                    .padding(.leading, 12)
                    .font(.custom("Abyss", size: 50.0))
                    .foregroundColor((Color(UIColor(red: 0.05, green: 0.05, blue: 0.06, alpha: 1.00))))
                    .lineLimit(1)
                    .minimumScaleFactor(0.01)
                    .padding(.bottom, 19
                    )
                        
                        
                        Text(nome.uppercased())
                            .padding(.leading, 12)
                            .font(.custom("Abyss", size: 50.0))
                        .offset(x: 0, y: -6).foregroundColor(Color(UIColor(red: 1.00, green: 0.77, blue: 0.00, alpha: 1.00)))
                        .lineLimit(1)
                        .minimumScaleFactor(0.01)
                        .padding(.bottom, 19
                        )
                    }
                    Spacer()
                Image(uiImage: avatar)
                    .resizable().scaledToFill()
                    .padding(.trailing, 12)
                    .frame(width: 58, height: 70, alignment: .center)
                    .padding(.bottom, 22
                    )
                    
                    UIRoundButton(label: ">")
                        .padding(.trailing, 16)
                            .padding(.bottom, 27
                        )
            })
            .edgesIgnoringSafeArea(.all)
            }.frame(minWidth: 0,
                    maxWidth: .infinity,
                    minHeight: 108,
                    maxHeight: 142,
                    alignment: .bottom
            )
            .background(BlurView())
            .cornerRadius(28, corners: [.bottomLeft, .bottomRight])
                .shadow(color: Color(UIColor(red: 0.38, green: 0.21, blue: 1.00, alpha: 0.2)), radius: 18, x: 0, y: 3)
        }
                 
    }
}

#if DEBUG
struct CompactHeader_Previews: PreviewProvider {
    static var previews: some View {
        CompactHeader(nome: mockStreamer.name,
                      avatar: mockStreamer.avatar)
    }
}
#endif

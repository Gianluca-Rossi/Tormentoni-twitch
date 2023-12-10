//
//  ButtonStyles.swift
//  Tormentoni Twitch
//
//  Created by Gianluca Rossi on 03/09/2020.
//  Copyright © 2020 Gianluca Rossi. All rights reserved.
//

import SwiftUI

let quoteBtnCornerRadius: CGFloat = 30

struct quoteBtn: ButtonStyle {
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            /** Creating a background shape instead of using the cornerRadius modifier for major performance gains **/
            //.cornerRadius(30, antialiased: false)
            .background(
                RoundedRectangle(cornerRadius: quoteBtnCornerRadius)
                    .foregroundColor(configuration.isPressed ? quoteBtnPressedColor : quoteBtnColor)
                .shadow(color: quoteBtnShadowColor, radius: 20, x: 0, y: -3)
            )
            .frame(minWidth: 0,
                   maxWidth: .infinity,
                   minHeight: 100,
                   maxHeight: 100,
                   alignment: .center)
            //.animation(.easeInOut(duration: 0.17))
            .scaleEffect(x: configuration.isPressed ? 0.95 : 1,
                         y: configuration.isPressed ? 0.95 : 1,
                         anchor: UnitPoint(x: 0.5, y: 0.5))
            .animation(configuration.isPressed ? pressAnimation() : releaseAnimation())
    }
    
}

func pressAnimation() -> Animation {
    return Animation.timingCurve(0.08, 0.43, 0.17, 0.75, duration: 0.25)
}

func releaseAnimation() -> Animation {
    return Animation.timingCurve(0.25, 0.1, 0.25, 1, duration: 0.3)
}

#if DEBUG
struct ButtonStyles_Previews: PreviewProvider {
    static var previews: some View {
        VStack() {
            Button(action: {
                print("")
            }) {
                HStack{
                    Text("PROVA")
                        .padding(.horizontal, 28)
                        .font(.custom("CanteenBNBold", size: 30.0))
                        .fixedSize(horizontal: false, vertical: true)
                        .lineLimit(3)
                        .minimumScaleFactor(0.5)
                    
                    Spacer()
                    
                    Image(uiImage: #imageLiteral(resourceName: "O_icona"))
                        .renderingMode(.original)
                        .padding(.trailing, 28)
                        .frame(width:100, height: 100, alignment: .trailing)
                        .opacity(1)
                    //.animation(.easeInOut(duration: 0.1))
                    //.animation(.easeIn(duration: 0.1), value: contenutoFrase.isPlaying)
                    //.transition(.opacity)
                    
                }
            }.buttonStyle(quoteBtn())
        }
    }
}
#endif

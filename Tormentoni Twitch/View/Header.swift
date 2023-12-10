//
//  Header.swift
//  Tormentoni Twitch
//
//  Created by Gianluca Rossi on 26/08/2020.
//  Copyright © 2020 Gianluca Rossi. All rights reserved.
//

import SwiftUI
import SwiftUIPager

struct Header: View {
    
    @State private var contentOffset: CGPoint = .zero
    
        @State private var scrollViewContentOffset = CGFloat(0)
    @State var page2: Int = 0
    @State var data2 = Array(mockStreamerArray2.indices)
        
        let streamerArray: [Streamer]
        let index: Int
    
        var body: some View {
                Pager(page: self.$page2,
                      data: self.data2,
                      id: \.self) {
                        self.streamerBtn(index: $0)
                
                    }.onPageChanged({ page in
                        
                        
                    })
                        .pagingPriority(.high)      // Setting it to high doesn't trigger the button tap event when the drag gesture starts inside a button tap area
                        .loopPages()
                        //.rotation3D()
                        //.padding()
                        .alignment(PositionAlignment.start)
                        .frame(minWidth: 0,
                               maxWidth: .infinity,
                               minHeight: 420,
                               maxHeight: 420,
                               alignment: .top
                    )
                    .edgesIgnoringSafeArea(.all)
                    .padding(.top, 130)
                
            

        }
func streamerBtn(index: Int) -> some View {
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
            print("\(mockStreamerArray2[index].name)")
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
        .background(Color(UIColor(red: 0.57, green: 0.28, blue: 1.00, alpha: 1.00)))
}
    }

#if DEBUG
struct Header_Previews: PreviewProvider {

    static var previews: some View {
        Group {
            Header(streamerArray: mockStreamerArray2, index: 0)
            Header(streamerArray: mockStreamerArray2, index: 0).previewDevice("iPad Pro (9.7-inch)")
        }
    }
}
#endif

//
//  PaginatedPhrasesList.swift
//  Tormentoni Twitch
//
//  Created by Gianluca Rossi on 02/09/2020.
//  Copyright © 2020 Gianluca Rossi. All rights reserved.
//

import SwiftUI
import SwiftUIPager

struct PaginatedPhrasesList: View {
    @State private var scrollViewContentOffset = CGFloat(0)
    
    @State var page2: Int = 0
    @State var data2 = Array(mockStreamerArray2.indices)
    @State private var mockStreamerArray = mockStreamerArray2
    @State private var phrasePlayingIndex = -1
    
    
    var body: some View {
        
        Pager(page: self.$page2,
              data: self.data2,
              id: \.self) {
                self.pageView($0)
        }
        .onPageChanged({ page in
            self.phrasePlayingIndex = -1
            
        })
            .disableDragging()
            //.delaysTouches(false)
            .interactive(0.95)
            //.pagingPriority(.high)    // Setting it to high doesn't trigger the button tap event when the drag gesture starts inside a button tap area
            .loopPages()
            //.rotation3D()
            //.padding()
            .swipeInteractionArea(.allAvailable)
            .pagingAnimation({ _ -> PagingAnimation in
                PagingAnimation.standard(duration: 0.3)
            })
            .alignment(PositionAlignment.justified)
            .frame(minWidth: 0,
                   maxWidth: .infinity,
                   minHeight: CGFloat((mockStreamerArray[page2].frasi.count) * (118) + 460),
                   maxHeight: CGFloat((mockStreamerArray[page2].frasi.count) * (118) + 460),
                   alignment: .top)
            .gesture(DragGesture())
    }
    
    private func pageView(_ index: Int) -> some View {
        VStack{
            Headerv2(streamerArray: mockStreamerArray, index: index)
            listaFrasiView(frasiStreamer: mockStreamerArray[index].frasi)
            Spacer()
        }
    }
    
    private func listaFrasiView(frasiStreamer:[Frase]) -> some View {
        
        ForEach(frasiStreamer.indices, id: \.self) { index in
            HStack{
                Spacer()
                ZStack(alignment: .leading) {
                    Button(action: {
                        print(frasiStreamer[index].testo)
                        self.avviaRiproduzione(streamerIndex: self.page2, quoteIndex: index)
                    }) {
                        HStack{
                            Text(frasiStreamer[index].testo.uppercased())
                                .padding(.horizontal, quoteBtnCornerRadius)
                                .font(.custom("CanteenBNBold", size: 30.0))
                                //.fixedSize(horizontal: false, vertical: true)
                                .lineLimit(3)
                                .minimumScaleFactor(0.5)
                                .foregroundColor(quoteTextColor)
                            Spacer()
                            Image(uiImage: frasiStreamer[index].icona)
                                .renderingMode(.original)
                                .padding(.trailing, 28)
                                .frame(width: (index == self.phrasePlayingIndex ? 0 : 100), height: 100, alignment: .trailing)
                                .opacity(index == self.phrasePlayingIndex ? 0 : 1)
                            //.animation(.easeInOut(duration: 0.1))
                            //.animation(.easeIn(duration: 0.1), value: contenutoFrase.isPlaying)
                            //.transition(.opacity)
                        }
                    }.buttonStyle(quoteBtn())
                }
                
                if (index == self.phrasePlayingIndex) {
                    HStack{
                        Spacer()
                        Button(action: {
                            print("Stop")
                            self.stop(streamerIndex: self.page2, quoteIndex: index)
                        }) {
                            ZStack {
                                Circle()
                                    .frame(width: (index == self.phrasePlayingIndex ? 76 : 0), height: 76)
                                    .foregroundColor(Color(UIColor(red: 0.05, green: 0.05, blue: 0.06, alpha: 1.00)))
                                    .background(Color(UIColor(red: 0.05, green: 0.05, blue: 0.06, alpha: 1.00)))
                                    .clipShape(Circle())
                                    .offset(x: 0, y: 4)
                                    .animation(.easeInOut(duration: 0.17))
                                Circle()
                                    .frame(width: (index == self.phrasePlayingIndex ? 76 : 0), height: 76)
                                    .foregroundColor(Color(UIColor(red: 0.23, green: 0.23, blue: 0.24, alpha: 1.00)))
                                    .background(Color(UIColor(red: 0.23, green: 0.23, blue: 0.24, alpha: 1.00)))
                                    .clipShape(Circle())
                                    .animation(.easeInOut(duration: 0.17))
                                RoundedRectangle(cornerRadius: 5)
                                    .foregroundColor(Color(UIColor(red: 1.00, green: 0.28, blue: 0.28, alpha: 1.00)))
                                    .frame(width: (index == self.phrasePlayingIndex ? 28 : 0), height: 28, alignment: .center)
                                    .animation(.easeInOut(duration: 0.17))
                            }
                        }
                        .buttonStyle(PlainButtonStyle())
                        //.frame(width: 0, height: 0, alignment: .center).hidden()
                        Button(action: {
                            print("Loop")
                        }) { ZStack {
                            Circle()
                                .frame(width: (index == self.phrasePlayingIndex ? 76 : 0), height: 76)
                                .foregroundColor(Color(UIColor(red: 0.05, green: 0.05, blue: 0.06, alpha: 1.00)))
                                .background(Color(UIColor(red: 0.05, green: 0.05, blue: 0.06, alpha: 1.00)))
                                .clipShape(Circle())
                                .offset(x: 0, y: 4)
                                .animation(.easeInOut(duration: 0.17))
                            Circle()
                                .frame(width: (index == self.phrasePlayingIndex ? 76 : 0), height: 76)
                                .foregroundColor(Color(UIColor(red: 0.23, green: 0.23, blue: 0.24, alpha: 1.00)))
                                .background(Color(UIColor(red: 0.23, green: 0.23, blue: 0.24, alpha: 1.00)))
                                .clipShape(Circle())
                                .animation(.easeInOut(duration: 0.17))
                            Image(uiImage: #imageLiteral(resourceName: "Loop_icona"))
                                .frame(width: (index == self.phrasePlayingIndex ? 53 : 0), height: 32, alignment: .center)
                                .animation(.easeInOut(duration: 0.17))
                            }
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
            }.padding(.trailing, 8)
                .padding(.horizontal, 8)
                .padding(.bottom, 8)
        }
    }
    
    private func avviaRiproduzione(streamerIndex: Int, quoteIndex: Int) {
        //guard let index = mockStreamerArray[streamerIndex].frasi.firstIndex(where: { $0.testo == frase.testo }) else { return }
        //mockStreamerArray[streamerIndex].frasi[index].isPlaying = true
        phrasePlayingIndex = quoteIndex
        //print("setto a true per " + mockStreamerArray[streamerIndex].frasi[index].testo)
        //Sound.play(file:"CP.WAV")
    }
    
    private func stop(streamerIndex: Int, quoteIndex: Int) {
        //guard let index = mockStreamerArray[streamerIndex].frasi.firstIndex(where: { $0.testo == frase.testo }) else { return }
        //mockStreamerArray[streamerIndex].frasi[index].isPlaying = false
        //print("setto a false per " + mockStreamerArray[streamerIndex].frasi[index].testo)
        
        phrasePlayingIndex = -1
        // Sound.stop(file:"CP.WAV")
    }
}

#if DEBUG
struct PaginatedPhrasesList_Previews: PreviewProvider {
    static var previews: some View {
        PaginatedPhrasesList()
    }
}
#endif

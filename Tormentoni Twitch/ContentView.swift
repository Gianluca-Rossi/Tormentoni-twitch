//
//  ContentView.swift
//  Tormentoni Twitch
//
//  Created by Gianluca Rossi on 25/08/2020.
//  Copyright © 2020 Gianluca Rossi. All rights reserved.
//

import SwiftUI

import SwiftUIPager


struct ContentView: View {
    @State var page: Int = 0
    @State private var scrollViewContentOffset = CGFloat(0)
    @State var frasiHomy : [Frase] = [
        Frase(testo: "ks", icona: #imageLiteral(resourceName: "KS_icona"), suono:"CP.WAV"),
        Frase(testo: "o?", icona: #imageLiteral(resourceName: "O_icona"), suono:"CP.WAV"),
        Frase(testo: "ma ti rendi conto?", icona: #imageLiteral(resourceName: "O_icona"), suono:"CP.WAV"),
        Frase(testo: "nove?", icona: #imageLiteral(resourceName: "9_icona"), suono:"CP.WAV"),
        Frase(testo: "aah?", icona: #imageLiteral(resourceName: "AAH_icona"), suono:"CP.WAV"),
        Frase(testo: "mi dissocio", icona: #imageLiteral(resourceName: "MI_DISSOCIO_icona"), suono:"CP.WAV")
    ]
    init() {
        UITableView.appearance().backgroundColor = .clear // tableview background
        UITableViewCell.appearance().backgroundColor = .clear // cell background
        
        // Set selected (onTapped) background color of cell.
        let color = UIView()
        color.backgroundColor = UIColor.clear
        UITableViewCell.appearance().selectedBackgroundView = color
    }
    
    var body: some View {
        ZStack(alignment: .top){
            
            VStack(alignment: .center, spacing: 0, content: {
                
                TrackableScrollView(.vertical, contentOffset: $scrollViewContentOffset) {
                    
                    /*
                    Section() {
                        Header(streamerArray: mockStreamerArray2, index: 0)
                            .opacity((scrollViewContentOffset > 210) ? 0 : 1)
                            .animation(.easeInOut(duration: 0.2))
                            .transition(.opacity)
                        //Text("\(scrollViewContentOffset)")
                    }
                    */
                        
                        
                    Section() {
                            PaginatedPhrasesList()
                    }
                    
                    // Adding an empty section to create a footer
                    Section(header: Text("")) {
                        listFooter()
                    }
                    .padding(.bottom, 50)
                    
                    
                    
                } //fine lista
                    .background(backgroundColor.edgesIgnoringSafeArea(.all))
                    .onAppear {
                        UITableView.appearance().separatorStyle = .none
                }
                
            }) //fine vstack
            
            CompactHeader(nome: "Homy", avatar: #imageLiteral(resourceName: "MI_DISSOCIO_icona"))
                .opacity((scrollViewContentOffset > 210) ? 1 : 0)
                .animation(.easeInOut(duration: 0.2))
                .transition(.opacity)
                               
        }
        .edgesIgnoringSafeArea(.all)
    }
    /*
    private func listaFrasiView(frasiStreamer:[Frase]) -> some View {
        ForEach(frasiStreamer, id: \.testo) { contenutoFrase in
            HStack{
                Spacer()
                ZStack(alignment: .leading) {
                    
                    
                    
                    Rectangle()
                        .background(Color(UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1.00)))
                        .cornerRadius(28, antialiased: true)
                        .offset(x: 0, y: 4)
                        .animation(.easeInOut(duration: 0.17))
                    
                    
                    Button(action: {
                        print(contenutoFrase.testo)
                        self.avviaRiproduzione(frase: contenutoFrase)
                    }) {
                        
                        HStack{
                            Text(contenutoFrase.testo.uppercased())
                                .padding(.horizontal, 28)
                                .font(.custom("CanteenBNBold", size: 30.0))
                                .fixedSize(horizontal: false, vertical: true)
                                .lineLimit(3)
                                .minimumScaleFactor(0.5)
                            
                            Spacer()
                            
                            Image(uiImage: contenutoFrase.icona)
                                .padding(.trailing, 28)
                                .frame(width: (contenutoFrase.isPlaying ? 0 : 100), height: 100, alignment: .trailing)
                                .opacity(contenutoFrase.isPlaying ? 0 : 1)
                            //.animation(.easeInOut(duration: 0.1))
                            //.animation(.easeIn(duration: 0.1), value: contenutoFrase.isPlaying)
                            //.transition(.opacity)
                            
                        }
                    }.background(backgroundColor)
                        .cornerRadius(28, antialiased: true)
                        .frame(minWidth: 0,
                               maxWidth: .infinity,
                               minHeight: 100,
                               maxHeight: 100,
                               alignment: .center
                    )
                        .buttonStyle(PlainButtonStyle())
                        .animation(.easeInOut(duration: 0.17))
                    
                    
                }
                
                if (contenutoFrase.isPlaying) {Spacer()}
                
                
                Button(action: {
                    print("Stop")
                    self.stop(frase: contenutoFrase)
                }) { ZStack {
                    Circle()
                        .frame(width: (contenutoFrase.isPlaying ? 76 : 0), height: 76)
                        .foregroundColor(Color(UIColor(red: 0.05, green: 0.05, blue: 0.06, alpha: 1.00)))
                        .background(Color(UIColor(red: 0.05, green: 0.05, blue: 0.06, alpha: 1.00)))
                        .clipShape(Circle())
                        .offset(x: 0, y: 4)
                        .animation(.easeInOut(duration: 0.17))
                    
                    
                    Circle()
                        .frame(width: (contenutoFrase.isPlaying ? 76 : 0), height: 76)
                        .foregroundColor(Color(UIColor(red: 0.23, green: 0.23, blue: 0.24, alpha: 1.00)))
                        .background(Color(UIColor(red: 0.23, green: 0.23, blue: 0.24, alpha: 1.00)))
                        .clipShape(Circle())
                        .animation(.easeInOut(duration: 0.17))
                    
                    
                    Rectangle()
                        .foregroundColor(Color(UIColor(red: 1.00, green: 0.28, blue: 0.28, alpha: 1.00)))
                        .cornerRadius(5, antialiased: true)
                        .frame(width: (contenutoFrase.isPlaying ? 28 : 0), height: 28, alignment: .center)
                        .animation(.easeInOut(duration: 0.17))
                    }
                }
                .buttonStyle(PlainButtonStyle())
                //.frame(width: 0, height: 0, alignment: .center).hidden()
                
                Button(action: {
                    print("Loop")
                }) { ZStack {
                    Circle()
                        .frame(width: (contenutoFrase.isPlaying ? 76 : 0), height: 76)
                        .foregroundColor(Color(UIColor(red: 0.05, green: 0.05, blue: 0.06, alpha: 1.00)))
                        .background(Color(UIColor(red: 0.05, green: 0.05, blue: 0.06, alpha: 1.00)))
                        .clipShape(Circle())
                        .offset(x: 0, y: 4)
                        .animation(.easeInOut(duration: 0.17))
                    
                    
                    Circle()
                        .frame(width: (contenutoFrase.isPlaying ? 76 : 0), height: 76)
                        .foregroundColor(Color(UIColor(red: 0.23, green: 0.23, blue: 0.24, alpha: 1.00)))
                        .background(Color(UIColor(red: 0.23, green: 0.23, blue: 0.24, alpha: 1.00)))
                        .clipShape(Circle())
                        .animation(.easeInOut(duration: 0.17))
                    
                    
                    Image(uiImage: #imageLiteral(resourceName: "Loop_icona"))
                        .frame(width: (contenutoFrase.isPlaying ? 53 : 0), height: 32, alignment: .center)
                        .animation(.easeInOut(duration: 0.17))
                    }
                }
                .buttonStyle(PlainButtonStyle())
                
            }
            .padding(.horizontal, 8)
            .padding(.bottom, 8)
        }
    }
    */
    private func listFooter() -> some View {
        HStack{
            Image(uiImage: #imageLiteral(resourceName: "Loop_icona"))
                .resizable().aspectRatio(contentMode: .fit)
                .frame(width: 28, height: 28, alignment: .center)
                .padding(.leading, 22)
            Text("CHEMMERD".uppercased())
                //.fontWeight(Font.Weight.semibold)
                .font(.custom("Abyss", size: 20))
                .foregroundColor((Color(UIColor(red: 0.94, green: 0.94, blue: 0.95, alpha: 1.00))))
                .kerning(0.2)
                .padding(.trailing, 16)
            
            Spacer()
            Text("Pensata col ❤️\ne realizzata col 🍑".uppercased())
                //.fontWeight(Font.Weight.semibold)
                .font(.custom("Abyss", size: 12))
                .foregroundColor(Color(UIColor(red: 0.81, green: 0.77, blue: 0.81, alpha: 1.00)))
                .kerning(0.2)
                .padding(.trailing, 22)
                .lineSpacing(1.7)
                .multilineTextAlignment(.trailing)
        }
    }
    
    private func avviaRiproduzione(frase: Frase) {
        guard let index = frasiHomy.firstIndex(where: { $0.testo == frase.testo }) else { return }
        frasiHomy[index].isPlaying = true
        Sound.play(file:"CP.WAV")
    }
    
    private func stop(frase: Frase) {
        guard let index = frasiHomy.firstIndex(where: { $0.testo == frase.testo }) else { return }
        frasiHomy[index].isPlaying = false
        Sound.stop(file:"CP.WAV")
    }
    /*
     private func updateCurrentProgress(_ time : CMTime) {
     
     // MARK: - TODO: update view
     if let current = myMediaPlayer?.currentPlaybackTime, let total = myMediaPlayer?.nowPlayingItem?.playbackDuration {
     print("\(current)/\(total)")
     progressBar.setProgress(Float(current / total), animated: true)
     
     }
     
     }
     */
}



#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
                .previewDevice("iPad Pro (9.7-inch)")
            ContentView()
                .previewDevice("iPhone 8")
        }
    }
}
#endif

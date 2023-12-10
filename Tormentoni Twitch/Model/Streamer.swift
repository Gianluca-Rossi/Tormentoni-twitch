//
//  Streamer.swift
//  Tormentoni Twitch
//
//  Created by Gianluca Rossi on 26/08/2020.
//  Copyright © 2020 Gianluca Rossi. All rights reserved.
//

import Foundation
import SwiftUI

struct Streamer : Equatable {
    static func == (lhs: Streamer, rhs: Streamer) -> Bool {
        return lhs.name == rhs.name
    }
    
    let name: String
    let avatar: UIImage
    var frasi: [Frase]
}

//#if DEBUG
let mockStreamer: Streamer = Streamer(name: "Homy", avatar: #imageLiteral(resourceName: "MI_DISSOCIO_icona"), frasi: [Frase(testo: "ks", icona: #imageLiteral(resourceName: "KS_icona"), suono:"CP.WAV"),
Frase(testo: "o?", icona: #imageLiteral(resourceName: "O_icona"), suono:"CP.WAV"),
Frase(testo: "ma ti rendi conto?", icona: #imageLiteral(resourceName: "O_icona"), suono:"CP.WAV"),
Frase(testo: "nove?", icona: #imageLiteral(resourceName: "9_icona"), suono:"CP.WAV"),
Frase(testo: "aah?", icona: #imageLiteral(resourceName: "AAH_icona"), suono:"CP.WAV"),
Frase(testo: "mi dissocio", icona: #imageLiteral(resourceName: "MI_DISSOCIO_icona"), suono:"CP.WAV"),
Frase(testo: "mi dissocio", icona: #imageLiteral(resourceName: "MI_DISSOCIO_icona"), suono:"CP.WAV"),
Frase(testo: "mi dissocio", icona: #imageLiteral(resourceName: "MI_DISSOCIO_icona"), suono:"CP.WAV")])

let pane: Streamer = Streamer(name: "Pane", avatar: #imageLiteral(resourceName: "MI_DISSOCIO_icona"), frasi: [Frase(testo: "riga1", icona: #imageLiteral(resourceName: "MI_DISSOCIO_icona"), suono: "CP.WAV"),Frase(testo: "riga2", icona: #imageLiteral(resourceName: "MI_DISSOCIO_icona"), suono: "CP.WAV")])

let skifi: Streamer = Streamer(name: "Skifi", avatar: #imageLiteral(resourceName: "MI_DISSOCIO_icona"), frasi: [Frase(testo: "rigax", icona: #imageLiteral(resourceName: "MI_DISSOCIO_icona"), suono: "CP.WAV"),Frase(testo: "rigay", icona: #imageLiteral(resourceName: "MI_DISSOCIO_icona"), suono: "CP.WAV")])

var mockStreamerArray2: [Streamer] = Array(repeating: mockStreamer, count: 12)
//var mockStreamerArray2: [Streamer] = [mockStreamer, pane, skifi]
//#endif

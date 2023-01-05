//
//  PreviewProvider.swift
//  Karaoke
//
//  Created by Alicja Grzeżułkowska on 02/01/2023.
//

import Foundation
import SwiftUI

extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.instance
    }
}

class DeveloperPreview {
    
    static let instance = DeveloperPreview()
    private init() { }
    
    let mainVm = MainScreenViewModel()
    
    let song = SongModel(id: 1, artist: "Toto", songName: "Africa", songText: "blablabla")
}

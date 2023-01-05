//
//  SongModel.swift
//  Karaoke
//
//  Created by Alicja Grzeżułkowska on 02/01/2023.
//

import Foundation

struct SongModel: Identifiable, Codable {
    let id: Int
    let artist: String
    let songName: String
    let songText: String
    
    enum CodingKeys: String, CodingKey {
        case id, artist, songName, songText
    }
}

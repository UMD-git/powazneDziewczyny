//
//  SongLyrics.swift
//  Karaoke
//
//  Created by Alicja Grzeżułkowska on 05/01/2023.
//

import SwiftUI

struct SongLyrics: View {
    
    //MARK: - Properties
    let song: SongModel
    
    //MARK: - Views
    var body: some View {
        VStack(spacing: 32.0) {
            text
            closeButton
        }
    }
    
    var text: some View {
        ScrollView {
            VStack(spacing: 24) {
                Text("\(song.artist) - \(song.songName)")
                    .font(.headline)
                Text(song.songText)
                    .font(.body)
            }
            .padding(.all, 24.0)
        }
    }
    
    var closeButton: some View {
        NavigationLink(destination: MainScreenView().environmentObject(MainScreenViewModel())
            .navigationBarHidden(true)) {
            GreenButtonView(text: "Close")
        }
    }
    
    struct SongLyrics_Previews: PreviewProvider {
        static var previews: some View {
            SongLyrics(song: dev.song)
        }
    }
}

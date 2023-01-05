//
//  SongOptionsModal.swift
//  Karaoke
//
//  Created by Alicja Grzeżułkowska on 04/01/2023.
//

import SwiftUI

struct SongOptionsModal: View {
    
    //MARK: - Properties
    @EnvironmentObject private var viewModel: MainScreenViewModel
    let song: SongModel
    
    //MARK: - Views
    var body: some View {
        content
            .frame(minHeight: 0, maxHeight: .infinity)
    }
    
    private var content: some View {
        VStack {
            seeLyrics
            openInSpotify
        }
    }
    
    private var openInSpotify: some View {
        Text("Open in Spotify")
            .font(.headline)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 56, maxHeight: 56)
            .background(Color.theme.elementsBackground)
            .onTapGesture {
                viewModel.openSongOnSpotify(artist: "\(song.artist)", song: "\(song.songName)")
            }
    }
    
    private var seeLyrics: some View {
        NavigationLink(destination: SongLyrics(song: song).environmentObject(MainScreenViewModel())
            .navigationBarHidden(true)) {
                Text("Song Lyrics")
                    .font(.headline)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 56, maxHeight: 56)
                    .background(Color.theme.elementsBackground)
                    .foregroundColor(Color.black)
            }
    }
}
    
    struct SongOptionsModal_Previews: PreviewProvider {
        static var previews: some View {
            SongOptionsModal(song: dev.song)
        }
    }

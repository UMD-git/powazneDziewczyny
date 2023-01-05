//
//  SongsRowView.swift
//  Karaoke
//
//  Created by Alicja Grzeżułkowska on 02/01/2023.
//

import SwiftUI

struct SongsRowView: View {
    
    //MARK: - Properties
    @State private var isFavourite: Bool = false
    @State private var showModal = false
    @State private var showText = false
    let song: SongModel
    
    //MARK: - Views]
    var body: some View {
        contnet
        if showModal {
            SongOptionsModal(song: song)
        }
    }
    
    private var contnet: some View {
        HStack(spacing: 0) {
            Text("\(song.id). \(song.artist) - \(song.songName)")
                .font(.headline)
                .padding(.leading, 24)
                .foregroundColor(Color.theme.accent)
            Spacer()
            CircleButtonView(iconName: isFavourite ? "heart.fill" : "heart", size: 30.0)
                .onTapGesture { isFavourite.toggle() }
        }
        .background(Color.theme.elementsBackground)
        .ignoresSafeArea()
        .onTapGesture {
            self.showModal = !showModal
        }
    }
}

struct SongsRowView_Previews: PreviewProvider {
    static var previews: some View {
        SongsRowView(song: dev.song)
            .previewLayout(.sizeThatFits)
    }
}

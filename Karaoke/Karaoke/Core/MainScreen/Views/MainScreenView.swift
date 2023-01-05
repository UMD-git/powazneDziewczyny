//
//  ContentView.swift
//  Karaoke
//
//  Created by Alicja Grzeżułkowska on 21/12/2022.
//

import SwiftUI

struct MainScreenView: View {
    
    // MARK: - Properties
    @EnvironmentObject private var viewModel: MainScreenViewModel
    @State private var showFavourites: Bool = false
    
    // MARK: - Views
    var body: some View {
        ZStack {
            Color.theme.background
                .ignoresSafeArea()
            content
        }
    }
    
    private var content: some View {
        VStack {
            header
            SearchBarView(songName: $viewModel.songName)
            if !showFavourites {
                allSongsList
                    .transition(.move(edge: .leading))
            }
            if showFavourites {
                favouriteSongsList
                    .transition(.move(edge: .trailing))
            }
        }
    }
    
    private var header: some View {
        HStack {
            CircleButtonView(iconName: showFavourites ? "plus" : "info", size: 50.0)
                .animation(.none)
            Spacer()
            Text(showFavourites ? "Your Playlist" : "Available Songs")
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundColor(Color.theme.accent)
                .animation(.none)
            Spacer()
            CircleButtonView(iconName: "chevron.right", size: 50.0)
                .rotationEffect(Angle(degrees: showFavourites ? 180 : 0 ))
                .onTapGesture {
                    withAnimation(.spring()) {
                        showFavourites.toggle()
                    }
                }
        }
    }
    
    private var allSongsList: some View {
        List {
            ForEach(viewModel.allSongs) { song in
                SongsRowView(song: song)
            }
            .listRowBackground(Color.clear)
            .listRowInsets(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
        }
        .listStyle(.plain)
    }
    
    private var favouriteSongsList: some View {
        List {
            ForEach(viewModel.allSongs) { song in
                SongsRowView(song: song)
            }
            .listRowBackground(Color.clear)
            .listRowInsets(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
        }
        .listStyle(.plain)
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            NavigationView {
                MainScreenView()
                    .navigationBarBackButtonHidden(true)
            }
            .environmentObject(dev.mainVm)
        }
    }
}

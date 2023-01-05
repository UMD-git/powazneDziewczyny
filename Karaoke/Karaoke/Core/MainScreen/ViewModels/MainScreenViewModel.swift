//
//  ManScreenViewModel.swift
//  Karaoke
//
//  Created by Alicja Grzeżułkowska on 21/12/2022.
//

import Foundation
import Combine
import WebKit

final class MainScreenViewModel: ObservableObject {
    
    // MARK: - Properties
    @Published var allSongs: [SongModel] = []
    @Published var favouriteSongs: [SongModel] = []
    @Published var songName: String = ""
    
    var closed: AnyPublisher<Void, Never> {
        closedSubject.eraseToAnyPublisher()
    }
    private var closedSubject = PassthroughSubject<Void, Never>()
    
    private let dataService = SongDataService()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        self.addSubscribers()
    }
    
    func closeAction() {
        closedSubject.send()
    }
    
    func addSubscribers() {
        $songName
            .combineLatest(dataService.$allSongs)
            .map(filterSongs)
            .sink { [weak self] (returnedSongs) in
                self?.allSongs = returnedSongs
            }
            .store(in: &cancellables)
    }
    
    //MARK: - Helpers
    private func filterSongs(text: String, songs: [SongModel]) -> [SongModel] {
        guard !text.isEmpty else { return songs }
        let lowercasedText = text.lowercased()
        return songs.filter { (song) -> Bool in
            return song.songName.lowercased().contains(lowercasedText) || song.artist.lowercased().contains(lowercasedText)
        }
    }
    
    func openSongOnSpotify(artist: String, song: String) {
        let encodedArtist = artist.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        let encodedSong = song.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        let query = "\(encodedArtist)%20\(encodedSong)"

        let spotifyUrl = URL(string: "spotify:search:\(query)")!
        if UIApplication.shared.canOpenURL(spotifyUrl) {
            UIApplication.shared.open(spotifyUrl)
        } else {
            let websiteUrl = URL(string: "https://open.spotify.com/search/\(query)")!
            UIApplication.shared.open(websiteUrl)
        }
    }
}

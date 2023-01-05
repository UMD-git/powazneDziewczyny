//
//  SongDataService.swift
//  Karaoke
//
//  Created by Alicja Grzeżułkowska on 03/01/2023.
//

import Foundation
import Combine

class SongDataService {
    
    @Published var allSongs: [SongModel] = []
    var songSubscription: AnyCancellable?
    
    init() {
        getSongs()
    }
    
    private func getSongs() {
        guard let url = Bundle.main.url(forResource: "SongList", withExtension: "json") else { return }
        
        songSubscription = URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .map { (output) -> Data in
                return output.data
            }
            .receive(on: DispatchQueue.main)
            .decode(type: [SongModel].self, decoder: JSONDecoder())
            .sink { (completion) in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error.localizedDescription)
                }
            } receiveValue: { [weak self] (returnedSongs) in
                self?.allSongs = returnedSongs
                self?.songSubscription?.cancel()
                
            }
    }
}

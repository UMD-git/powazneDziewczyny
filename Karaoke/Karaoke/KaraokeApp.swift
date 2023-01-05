//
//  KaraokeApp.swift
//  Karaoke
//
//  Created by Alicja Grzeżułkowska on 21/12/2022.
//

import SwiftUI

@main
struct KaraokeApp: App {

    var body: some Scene {
        WindowGroup {
            NavigationView {
                StartView()
                    .navigationBarHidden(true)
            }
        }
    }
}

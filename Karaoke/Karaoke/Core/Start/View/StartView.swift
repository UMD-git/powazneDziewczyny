//
//  ContentView.swift
//  Karaoke
//
//  Created by Alicja Grzeżułkowska on 21/12/2022.
//

import SwiftUI

struct StartView: View {
    
    // MARK: - Views
    var body: some View {
        Color.theme.background
            .ignoresSafeArea(.all)
            .overlay(content)
    }
    
    private var content: some View {
        VStack(alignment: .center) {
            topText
            background
            continueButton
        }
        .padding(.horizontal, 24.0)
    }
    
    private var topText: some View {
        Image("powazneKaraoke")
    }
    private var background: some View {
        Image("transparentLogo400")
    }
    
    private var continueButton: some View {
        NavigationLink(destination: MainScreenView()
            .environmentObject(MainScreenViewModel())
            .navigationBarHidden(true)) {
            GreenButtonView(text: "Continue")
        }
    }
}

//
//  ContentView.swift
//  Karaoke
//
//  Created by Alicja Grzeżułkowska on 21/12/2022.
//

import SwiftUI

struct StartView: View {
    
    // MARK: - Properties
   private(set) var viewModel = StartViewModel()
    
    // MARK: - Views
    var body: some View {
        Color("poglosHouse")
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
        Button("Kontynuuj", action: viewModel.inputs.continueButton)
    }

    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            StartView(viewModel: StartViewModel())
        }
    }
}

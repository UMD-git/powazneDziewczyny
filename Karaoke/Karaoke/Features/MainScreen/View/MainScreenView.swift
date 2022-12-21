//
//  ContentView.swift
//  Karaoke
//
//  Created by Alicja Grzeżułkowska on 21/12/2022.
//

import SwiftUI

struct MainScreenView: View {
    
    // MARK: - Properties
    @State private var songName: String = ""
    
    // MARK: - Views
    var body: some View {
        VStack(alignment: .center) {
            background
            search
        }
    }
    
    private var search: some View {
        TextField("enter song name", text: $songName)
            .padding(.horizontal, 24.0)
            .foregroundColor(.blue)
            .frame(width: 200.0, height: 48.0, alignment: .center)
            .disableAutocorrection(true)
                .border(.secondary)
                .cornerRadius(4.0)

    }
    
    private var background: some View {
        Image("AppIcon")
    }
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            MainScreenView()
        }
    }
}

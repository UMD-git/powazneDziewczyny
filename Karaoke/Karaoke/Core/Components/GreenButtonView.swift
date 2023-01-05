//
//  GreenButtonView.swift
//  Karaoke
//
//  Created by Alicja Grzeżułkowska on 05/01/2023.
//

import SwiftUI

struct GreenButtonView: View {
    
    // MARK: - Properties
    let text: String
    
    //MARK: - View
    var body: some View {
        Text(text)
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 56)
            .background(Color.green)
    }
}

struct GreenButtonView_Previews: PreviewProvider {
    static var previews: some View {
        GreenButtonView(text: "elo")
    }
}

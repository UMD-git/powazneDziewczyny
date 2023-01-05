//
//  SearchBarView.swift
//  Karaoke
//
//  Created by Alicja Grzeżułkowska on 02/01/2023.
//

import SwiftUI

struct SearchBarView: View {
    
    //MARK: - Properties
    @Binding var songName: String
    
    //MARK: - View
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(
                    songName.isEmpty ?
                    Color.gray : Color.black
                )
            TextField("Search", text: $songName)
                .foregroundColor(Color.black)
                .disableAutocorrection(true)
                .overlay(
                    Image(systemName: "xmark.circle.fill")
                        .padding()
                        .offset(x:10)
                        .foregroundColor(Color.black)
                        .opacity(songName.isEmpty ? 0.0 : 1.0)
                        .onTapGesture {
                            UIApplication.shared.endEditing()
                            songName = ""
                        }
                    ,alignment: .trailing
                )
        }
        .font(.headline)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 50)
                .fill(Color.white)
                .shadow(
                    color: Color.theme.accent.opacity(0.15),
                    radius: 10, x: 0, y: 0)
        )
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView(songName: .constant(""))
    }
}

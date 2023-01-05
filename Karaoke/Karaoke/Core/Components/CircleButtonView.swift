//
//  CircleButtonView.swift
//  Karaoke
//
//  Created by Alicja Grzeżułkowska on 02/01/2023.
//

import SwiftUI

struct CircleButtonView: View {
    
    // MARK: - Properties
    let iconName: String
    let size: CGFloat
    
    // MARK: - View
    var body: some View {
        Image(systemName: iconName)
            .font(.headline)
            .foregroundColor(Color.theme.accent)
            .frame(width: size, height: size)
            .background(
                Circle()
                    .foregroundColor(Color.theme.background)
                )
            .shadow(
                color: Color.theme.accent.opacity(0.25),
                radius: 10, x: 0, y: 0
            )
            .padding()
    }
}

struct CircleButtonView_Previews: PreviewProvider {
    static var previews: some View {
            CircleButtonView(iconName: "heart.fill", size: 50.0)
                .previewLayout(.sizeThatFits)
    }
}

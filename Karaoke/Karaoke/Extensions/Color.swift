//
//  Color.swift
//  Karaoke
//
//  Created by Alicja Grzeżułkowska on 02/01/2023.
//

import Foundation
import SwiftUI

extension Color {
    static let theme = ColorTheme()
}

struct ColorTheme {
    let accent = Color("AccentColor")
    let background = Color("BackgroundColor")
    let elementsBackground = Color("ListBackgroundColor")
}

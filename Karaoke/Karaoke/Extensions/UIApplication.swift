//
//  UIApplication.swift
//  Karaoke
//
//  Created by Alicja Grzeżułkowska on 02/01/2023.
//

import Foundation
import SwiftUI

extension UIApplication {
    
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

//
//  Color+Hex.swift
//  Nutri
//
//  Created by Abdul Basit on 28/04/25.
//

import SwiftUI

extension Color {
    init(hex: String) {
        let hexString = hex.replacingOccurrences(of: "#", with: "")
        let scanner = Scanner(string: hexString)
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)

        let red = Double((rgb & 0xFF0000) >> 16) / 255.0
        let green = Double((rgb & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgb & 0x0000FF) / 255.0

        self.init(red: red, green: green, blue: blue)
    }
}

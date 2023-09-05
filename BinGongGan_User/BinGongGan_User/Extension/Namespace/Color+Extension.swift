//
//  Color+.swift
//  BinGongGan_User
//
//  Created by 마경미 on 05.09.23.
//

import Foundation
import SwiftUI

extension Color {
    // MARK: #FFFFFF와 같이 16진수 hexString color를 쓸 수 있음.
    init(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

        var rgb: UInt64 = 0

        Scanner(string: hexSanitized).scanHexInt64(&rgb)

        let red = Double((rgb & 0xFF0000) >> 16) / 255.0
        let green = Double((rgb & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgb & 0x0000FF) / 255.0

        self.init(red: red, green: green, blue: blue)
    }

    static let primary = Color(hex: "#655D55")
    
    static let secondary = Color(hex: "#8DB9C1")
    
    static let background = Color(hex: "#F5F5F5")
    
    static let white = Color(hex: "#FFFFFF")
    
    static let black = Color(hex:"#000000")
    
    static let darkGray = Color(hex: "#666666")
    
    static let mediumGray = Color(hex: "#999999")
    
    static let lightGray = Color(hex: "#CCCCCC")
}

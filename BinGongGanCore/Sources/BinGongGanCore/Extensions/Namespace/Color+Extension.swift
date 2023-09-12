//
//  Color+.swift
//  BinGongGan_User
//
//  Created by 마경미 on 05.09.23.
//

import Foundation
import SwiftUI

// Color 사용으로 13이상
@available(iOS 13.0, *)
public extension Color {
    // MARK: #FFFFFF와 같이 16진수 hexString color를 쓸 수 있음.
    init(hex: String, opacity: Double = 1.0) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

        var rgb: UInt64 = 0

        Scanner(string: hexSanitized).scanHexInt64(&rgb)

        let red = Double((rgb & 0xFF0000) >> 16) / 255.0
        let green = Double((rgb & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgb & 0x0000FF) / 255.0

        self.init(red: red, green: green, blue: blue, opacity: opacity)
    }

    // MARK: 정의된 Color와 겹치지 않는 닉네임 선정
    static let myBrown = Color(hex: "#655D55")
    
    static let myMint = Color(hex: "#8DB9C1")
    
    static let myBackground = Color(hex: "#F5F5F5")
    
    static let myDarkGray = Color(hex: "#666666")
    
    static let myMediumGray = Color(hex: "#999999")
    
    static let myLightGray = Color(hex: "#CCCCCC")
    
    static let myLightGray2 = Color(hex: "#EBEEF2")
    
    static let myErrorColor = Color(hex: "#FFCDD2", opacity: 0.5)
    
    static let myWarningColor = Color(hex: "#FED875")
}

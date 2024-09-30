//
//  Color+.swift
//  musicalRecordProject
//
//  Created by 박성민 on 9/12/24.
//

import SwiftUI

extension Color {
    static let asMainColor = Color(hex:"D1B2FF")
    static let asMainBackground = Color(hex:"E3C4FF")
    static let asPlaceholder = Color.gray
    static let asFont = Color(hex:"242424")
    static let asBackground = Color.white
    static let asBlack = Color.black
    static let asSubFont = Color.subFont
    static let logoColor = Color.black
    static let asBoardInFont = Color(hex: "FFE8FF")
    static let asGrayFont = Color.gray
    static let grayBackground = Color(UIColor.systemGray6)
    static let ticketBackground = Color(hex: "F3E8FF")
    static let starColor = Color(hex:"D1B2FF")
    static let ticketLine = Color(hex: "E6D7FF")
    static let asredColor = Color(hex: "FF4D4F")
    static let removeColor = Color(hex: "D32F2F")
    static let ticketButtonColor = Color(hex: "5C3D99")
    static let uiColorasMainColor = UIColor(red: 209, green: 178, blue: 255, alpha: 1)
}
extension Color {
  init(hex: String) {
    let scanner = Scanner(string: hex)
    _ = scanner.scanString("#")
    
    var rgb: UInt64 = 0
    scanner.scanHexInt64(&rgb)
    
    let r = Double((rgb >> 16) & 0xFF) / 255.0
    let g = Double((rgb >>  8) & 0xFF) / 255.0
    let b = Double((rgb >>  0) & 0xFF) / 255.0
    self.init(red: r, green: g, blue: b)
  }
}

//
//  Color+.swift
//  musicalRecordProject
//
//  Created by 박성민 on 9/12/24.
//

import SwiftUI

extension Color {
    static let asMainColor = Color(hex:"ab94e6")
    static let asMainBackground = Color(hex:"ab94e6")
    static let asPlaceholder = Color.gray
    static let asFont = Color.black
    static let asBackground = Color.white
    static let asBlack = Color.black
    static let asSubFont = Color.subFont
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

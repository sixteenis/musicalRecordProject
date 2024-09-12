//
//  SelectType.swift
//  musicalRecordProject
//
//  Created by 박성민 on 9/12/24.
//

import Foundation

enum SelectType: CaseIterable {
    case performance
    case Musical
    
    var title: String {
        switch self {
        case .performance:
            "연극"
        case .Musical:
            "뮤지컬"
        }
    }
}

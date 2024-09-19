//
//  GenreType.swift
//  musicalRecordProject
//
//  Created by 박성민 on 9/19/24.
//

import Foundation

enum Genre {
    case play
    case musical
    
    var codeString: String {
        switch self {
        case .play:
            return "AAAA"
        case .musical:
            return "GGGA"
        }
    }
}


//
//  TicketModel.swift
//  musicalRecordProject
//
//  Created by 박성민 on 9/22/24.
//

import Foundation

struct TicketModel: Identifiable {
    let id = UUID()
    var isBack = false
    let title: String
}

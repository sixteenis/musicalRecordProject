//
//  PerformanceModel.swift
//  musicalRecordProject
//
//  Created by 박성민 on 9/23/24.
//

import Foundation


struct PerformanceModel: Identifiable {
    let id = UUID()
    let simple: SimplePerformance
    var detail: DetailPerformance?
}

struct SimplePerformance {
    let playId: String
    let playDate: String
    let title: String
    let place: String
    let postURL: String
}
struct DetailPerformance {
    let placeId: String
    let actors: String
    let runtime: String
    let limitAge: String
}

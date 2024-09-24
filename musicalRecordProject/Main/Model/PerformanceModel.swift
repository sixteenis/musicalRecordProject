//
//  PerformanceModel.swift
//  musicalRecordProject
//
//  Created by 박성민 on 9/23/24.
//

import Foundation


struct PerformanceModel: Identifiable {
    let id = UUID()
    var emptyDetailCheck = true
    let simple: SimplePerformance
    var detail: DetailPerformance = DetailPerformance()
}

struct SimplePerformance {
    let playId: String
    let playDate: String
    let title: String
    let place: String
    let postURL: String
}
struct DetailPerformance {
    var placeId: String
    var actors: String
    var runtime: String
    var limitAge: String
    init(placeId: String, actors: String, runtime: String, limitAge: String) {
        self.placeId = placeId
        self.actors = actors
        self.runtime = runtime
        self.limitAge = limitAge
    }
    init() {
        self.placeId = ""
        self.actors = ""
        self.runtime = ""
        self.limitAge = ""
    }
}

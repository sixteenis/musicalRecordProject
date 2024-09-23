//
//  PerformanceModel.swift
//  musicalRecordProject
//
//  Created by 박성민 on 9/23/24.
//

import Foundation


struct PerformanceModel: Identifiable {
    static let mockupData = [
        PerformanceModel(simple: SimplePerformance(playDate: "2024.02.04 ~ 2024.07.02", title: "취해도 취해도 취하지 않아서 [대학로]", place: "피가로아트홀", postURL: "http://www.kopis.or.kr/upload/pfmPoster/PF_PF248955_240912_102352.gif"), detail: DetailPerformance(actors: "어쩌구", runtime: "120분", limitAge: "12세이상")),
        PerformanceModel(simple: SimplePerformance(playDate: "2024.02.07 ~ 2024.04.07", title: "대진대학교 연기예술학과 하계워크숍, 키스", place: "피가로아트홀", postURL: "http://www.kopis.or.kr/upload/pfmPoster/PF_PF248706_240910_113034.jpg"), detail: nil),
        PerformanceModel(simple: SimplePerformance(playDate: "2024.02.04", title: "처드 3세", place: "피가로아트홀", postURL: "http://www.kopis.or.kr/upload/pfmPoster/PF_PF248955_240912_102352.gif"), detail: nil),
        PerformanceModel(simple: SimplePerformance(playDate: "2024.02.04", title: "취해도 취해도 취하지 않아서 [대학로]", place: "피가로아트홀", postURL: "http://www.kopis.or.kr/upload/pfmPoster/PF_PF248955_240912_102352.gif"), detail: nil),
        PerformanceModel(simple: SimplePerformance(playDate: "2024.02.04", title: "취해도 취해도 취하지 않아서 [대학로]", place: "피가로아트홀", postURL: "http://www.kopis.or.kr/upload/pfmPoster/PF_PF248955_240912_102352.gif"), detail: nil)
    ]
    let id = UUID()
    let simple: SimplePerformance
    var detail: DetailPerformance?
}

struct SimplePerformance {
    let playDate: String
    let title: String
    let place: String
    let postURL: String
}
struct DetailPerformance {
    let actors: String
    let runtime: String
    let limitAge: String
}

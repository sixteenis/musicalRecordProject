//
//  AnalysisView.swift
//  musicalRecordProject
//
//  Created by 박성민 on 10/4/24.
//

import SwiftUI
import Charts

struct AnalysisView: View {
    @State private var width: CGFloat = UIScreen.main.bounds.width
    @State private var height: CGFloat = UIScreen.main.bounds.height
    var body: some View {
        weekChars()
            .frame(width: width, height: height / 3)
    }
}

#Preview {
    AnalysisView()
}

private extension AnalysisView {
    func weekChars() -> some View {
        Chart {
            ForEach(ExPlayCnt.ex, id: \.id) {
                BarMark (
                    x: .value("주차", $0.day),
                    y: .value("횟수", $0.cnt)
                )
            }
        }
        .chartYAxis(.hidden)
        .chartXAxis {
            AxisMarks (values: .automatic)
        }
    }
}

struct ExPlayCnt: Identifiable, Hashable {
    let id = UUID()
    let day: String
    let cnt: Int
    
    static let ex = [
        ExPlayCnt(day: "1주", cnt: 5),
        ExPlayCnt(day: "2주", cnt: 3),
        ExPlayCnt(day: "3주", cnt: 2),
        ExPlayCnt(day: "4주", cnt: 7),
        ExPlayCnt(day: "5주", cnt: 1),
    ]
}
struct ExMoneyCnt {
    
}

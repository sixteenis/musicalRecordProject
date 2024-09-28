//
//  RatingView.swift
//  musicalRecordProject
//
//  Created by 박성민 on 9/28/24.
//

import SwiftUI
import Cosmos

struct RatingView: UIViewRepresentable {
    @Binding var rating: Double
    
    func makeUIView(context: Context) -> CosmosView {
        let cosmosView = CosmosView()
        cosmosView.settings.fillMode = .half
        cosmosView.settings.starSize = 35
        cosmosView.settings.updateOnTouch = true
        cosmosView.settings.minTouchRating = 0
        cosmosView.didFinishTouchingCosmos = { value in
            rating = value
        }
        return cosmosView
    }
    
    func updateUIView(_ uiView: CosmosView, context: Context) {
        uiView.rating = rating
    }
}

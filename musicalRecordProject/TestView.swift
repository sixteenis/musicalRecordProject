//
//  TestView.swift
//  musicalRecordProject
//
//  Created by 박성민 on 10/7/24.
//

import SwiftUI
import MapKit



struct TestView: View {
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.5666791, longitude: 126.9782914), span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005))
    
    // Wrap the MapMarker in an array of identifiable items
    var locations = [Location(coordinates: CLLocationCoordinate2D(latitude: 37.5666791, longitude: 126.9782914))]

    var body: some View {
        Map(coordinateRegion: $region, interactionModes: [], annotationItems: locations) { location in
            //MapMarker(coordinate: location.coordinates, tint: .blue)
            MapAnnotation(coordinate: location.coordinates) {
                CustomMapMarker()
            }
        }
    }
}

#Preview {
    TestView()
}

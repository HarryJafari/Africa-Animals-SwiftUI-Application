//
//  InsetMapView.swift
//  Africa
//
//  Created by Harry Jafari on 13/8/2024.
//

import SwiftUI
import MapKit

struct InsetMapView: View {
    let animal: Animal
    
    @State private var regin = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599), span: MKCoordinateSpan(latitudeDelta: 60.0, longitudeDelta: 60.0))
    var body: some View {
        Map(coordinateRegion: $regin)
            .overlay(
                NavigationLink(destination: MapView()) {
                    HStack {
                        Image(systemName: "mappin.circle")
                            .foregroundColor(Color.white)
                            .imageScale(.large)
                        Text("Locations")
                            .foregroundColor(.accentColor)
                            .fontWeight(.bold)
                    }
                    .padding(.vertical,12)
                    .padding(.horizontal,14)
                    .background(
                        Color.black.opacity(0.4)
                            .cornerRadius(8)
                    )
                }
                    .padding(12)
                    , alignment: .topTrailing
            )
            .frame(height: 256)
            .cornerRadius(12)
    }
}

struct InsetMapView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode ("animals.json")
    
    static var previews: some View {
        NavigationView {
            InsetMapView(animal: animals[0])
        }
    }
}

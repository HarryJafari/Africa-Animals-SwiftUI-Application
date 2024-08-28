//
//  MapView.swift
//  Africa
//
//  Created by Harry Jafari on 1/8/2024.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @State private var region: MKCoordinateRegion = {
        var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
        
        return mapRegion
    }()
    
    let locations: [NationalParkLocationModel] = Bundle.main.decode("locations.json")
    
    var body: some View {
        //Simle map
        //Map(coordinateRegion: $region)
        
        //Comple Map
        Map(coordinateRegion: $region, annotationItems: locations, annotationContent:  {item in
            //Old  Version
            // MapPin(coordinate: item.location, tint: .accentColor)
            //New Version
            // MapMarker(coordinate: item.location, tint: .accentColor)
            //Custom
            //            MapAnnotation(coordinate: item.location) {
            //                Image("logo")
            //                    .resizable()
            //                    .scaledToFit()
            //                    .frame(width: 35 , height: 35 , alignment: .center)
            //
            //            }
            //Complex Map Anotation
            
            MapAnnotation(coordinate: item.location ) {
                MapAnnotationView(location: item)
            }
            
        }) // MAP
        .overlay (
            HStack {
                Image("compass")
                    .resizable()
                    .scaledToFit()
                .frame(width: 48, height: 48 , alignment: .center)
                VStack(alignment: .leading , spacing: 3){
                    HStack {
                        Text("Latitude:")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.latitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }
                    Divider()
                    HStack {
                        Text("Longitude:")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.longitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }
                }
            }
                .padding(.vertical, 12)
                .padding(.horizontal , 16)
                .background(
                    Color.black
                        .cornerRadius(8)
                        .opacity(0.6)
        )
                .padding()
            , alignment: .top
      
        )
       
        
    }
}

#Preview {
    MapView()
}

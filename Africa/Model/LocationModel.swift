//
//  LocationModel.swift
//  Africa
//
//  Created by Harry Jafari on 16/8/2024.
//

import Foundation
import MapKit

struct NationalParkLocationModel: Codable, Identifiable {
  var id: String
    var name: String
    var image: String
    var latitude: Double
    var longitude: Double
    
    var location: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}

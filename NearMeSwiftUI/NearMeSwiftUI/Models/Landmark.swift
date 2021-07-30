//
//  Landmark.swift
//  NearMeSwiftUI
//
//  Created by Esteban Moncaleano on 29/07/21.
//

import Foundation
import MapKit

struct Landmark: Identifiable {
    
    let id = UUID()
    let placemark: MKPlacemark
    
    var name: String {
        placemark.title ?? ""
    }
    
    var title: String {
        placemark.title ?? ""
    }
    
    var coordinate: CLLocationCoordinate2D {
        placemark.coordinate
    }
}

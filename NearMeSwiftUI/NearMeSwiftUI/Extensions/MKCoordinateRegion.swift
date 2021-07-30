//
//  MKCoordinateRegion.swift
//  NearMeSwiftUI
//
//  Created by Esteban Moncaleano on 29/07/21.
//

import Foundation
import MapKit

extension MKCoordinateRegion {
    
    static var defaultRegion: MKCoordinateRegion {
        // Placeholder region located in Bogota
        return MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 4.6257883, longitude: -74.1991923), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    }
}

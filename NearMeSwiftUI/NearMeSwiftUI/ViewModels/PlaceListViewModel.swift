//
//  PlaceListViewModel.swift
//  NearMeSwiftUI
//
//  Created by Esteban Moncaleano on 29/07/21.
//

import Foundation
import Combine
import MapKit

class PlaceListViewModel: ObservableObject {
    
    // MARK: Private values
    private let locationManager: LocationManager
    var cancellable: AnyCancellable?
    
    // MARK: Public values
    @Published var currentLocation: CLLocationCoordinate2D?
    @Published var landmarks: [Landmark] = []
    
    init() {
        locationManager = LocationManager()
        
        // Se mantiene la referencia del llamado para que no consuma memoria en caso de ya no ser necesario
        cancellable = locationManager.$location.sink { (location) in
            // Aca se hace un unwrappped de la localización que se reciba
            if let location = location {
                DispatchQueue.main.async {
                    self.currentLocation = location.coordinate 
                }
            }
        }
    }
    
    func searchLandmarks(searchTerm: String) {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = searchTerm
        
        let search = MKLocalSearch(request: request)
        search.start { (response, error) in
            if let error = error {
                print(error)
            } else if let response = response {
                let mapItems = response.mapItems
                self.landmarks = mapItems.map {
                    return Landmark(placemark: $0.placemark)
                }
            }
        }
    }
}

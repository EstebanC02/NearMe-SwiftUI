//
//  MainView.swift
//  NearMeSwiftUI
//
//  Created by Esteban Moncaleano on 29/07/21.
//

import SwiftUI
import MapKit

struct MainView: View {
    
    @StateObject private var placeListViewModel = PlaceListViewModel()
    @State private var userTrakingMode: MapUserTrackingMode = .follow
    
    private func getRegion() -> Binding<MKCoordinateRegion> {
        guard let coordinate = placeListViewModel.currentLocation else {
            return .constant(MKCoordinateRegion.defaultRegion)
        }
        
        return .constant(MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)))
    }
    
    var body: some View {
        Map(coordinateRegion: getRegion(), interactionModes: .all, showsUserLocation: true, userTrackingMode: self.$userTrakingMode)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

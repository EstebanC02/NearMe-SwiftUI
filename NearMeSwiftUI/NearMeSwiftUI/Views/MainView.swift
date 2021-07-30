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
    
    @State private var searchValue: String = ""
    
    private func getRegion() -> Binding<MKCoordinateRegion> {
        guard let coordinate = placeListViewModel.currentLocation else {
            return .constant(MKCoordinateRegion.defaultRegion)
        }
        
        return .constant(MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)))
    }
    
    var body: some View {
        
        ZStack {
            Map(coordinateRegion: getRegion(), interactionModes: .all, showsUserLocation: true, userTrackingMode: self.$userTrakingMode, annotationItems: self.placeListViewModel.landmarks) { landmark in
                MapMarker(coordinate: landmark.coordinate)
            }
            .edgesIgnoringSafeArea(.all)
            
            VStack {
                TextField("Search", text: self.$searchValue, onEditingChanged: { _ in }, onCommit: {
                    self.placeListViewModel.searchLandmarks(searchTerm: self.searchValue)
                })
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                
                Spacer()
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

//
//  ContentView.swift
//  LocationSaving
//
//  Created by Derefaa Cline on 3/3/23.
//

import SwiftUI
import CoreLocation

struct ContentView: View {
    @StateObject var locationDataManager = LocationDataManager()
    var body: some View {
        VStack {
            switch locationDataManager.locationManager.authorizationStatus{
            case .authorizedWhenInUse:
            Text("Your current location is:")
            Text("Latitude:\(locationDataManager.locationManager.location?.coordinate.latitude.description ?? "Error Loading") ")
            Text("Longitude:\(locationDataManager.locationManager.location?.coordinate.longitude.description ?? "Error Loading") ")
            case .notDetermined:
                Text("Finding your location")
                ProgressView()
            case .restricted:
                Text("Current location was restriced")
            case .denied:
                Text("Current location was denied")
            default:
                ProgressView()
            }
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundColor(.accentColor)
//            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

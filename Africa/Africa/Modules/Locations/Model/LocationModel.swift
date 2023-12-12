//
//  LocationModel.swift
//  Africa
//
//  Created by Yunus Emre Berdibek on 7.10.2023.
//

import Foundation
import MapKit

struct NationalParkLocation: Codable, Identifiable {
    let id: String
    let name: String
    let image: String
    let latitude: Double
    let longitude: Double

    //Computet property
    var location: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}

extension NationalParkLocation {
    static let nationalParkLocations: [NationalParkLocation] = Bundle.main.decode("locations.json")
}

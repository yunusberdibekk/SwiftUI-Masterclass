//
//  LocationsView.swift
//  Africa
//
//  Created by Yunus Emre Berdibek on 5.10.2023.
//

import MapKit
import SwiftUI

struct LocationsView: View {
    // MARK: - PROPERTIES

    @State private var region: MKCoordinateRegion = {
        var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)

        return mapRegion
    }()

    let locations: [NationalParkLocation] = Bundle.main.decode("locations.json")

    // MARK: - BODY

    var body: some View {
        Map(initialPosition: .region(region)) {
            ForEach(locations) { item in
                Annotation("", coordinate: item.location) {
                    MapAnnonationView(location: item)
                }
            }
        } //: MAP
        .overlay(
            HStack(alignment: .center, spacing: 12) {
                Image(.compass)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48)

                VStack(alignment: .leading, spacing: 3) {
                    HStack {
                        Text("Latitude: ")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundStyle(.accent)

                        Spacer()

                        Text("\(region.center.latitude)")
                            .font(.footnote)
                            .foregroundStyle(.white)
                    }
                    Divider()

                    HStack {
                        Text("Longitude: ")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundStyle(.accent)

                        Spacer()

                        Text("\(region.center.longitude)")
                            .font(.footnote)
                            .foregroundStyle(.white)
                    }
                }
            } //: HSTACK
            .padding(.vertical, 12)
            .padding(.horizontal, 16)
            .background(
                Color.black
                    .clipShape(.rect(cornerRadius: 8))
                    .opacity(0.6)
            )
            .padding(10), alignment: .top
        )
    }
}

// MARK: PREVIEW

#Preview {
    LocationsView()
}

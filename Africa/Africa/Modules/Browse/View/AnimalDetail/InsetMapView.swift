//
//  InsetMapView.swift
//  Africa
//
//  Created by Yunus Emre Berdibek on 5.10.2023.
//

import MapKit
import SwiftUI

struct InsetMapView: View {
    // MARK: - PROPERTIES

    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599), span: MKCoordinateSpan(latitudeDelta: 60.0, longitudeDelta: 60.0))

    // MARK: - BODY

    var body: some View {
        Map(coordinateRegion: $region)
            .overlay(
                NavigationLink {
                    LocationsView()
                } label: {
                    HStack {
                        Image(systemName: "mappin.circle")
                            .foregroundStyle(.white)
                            .imageScale(.large)

                        Text("Locations")
                            .foregroundStyle(.accent)
                            .fontWeight(.bold)
                    } //: HSTACK
                    .padding(.vertical, 10)
                    .padding(.horizontal, 14)
                    .background(
                        Color.black
                            .opacity(0.14)
                            .clipShape(.rect(cornerRadius: 8))
                    )
                } // NAV.LINK
                .padding(12), alignment: .topTrailing
            )
            .frame(height: 256)
            .clipShape(.rect(cornerRadius: 12))
    }
}

// MARK: - PREVIEW

#Preview {
    InsetMapView()
}  

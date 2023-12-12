//
//  MapAnnonationView.swift
//  Africa
//
//  Created by Yunus Emre Berdibek on 7.10.2023.
//

import SwiftUI

struct MapAnnonationView: View {
    // MARK: - PROPERTIES

    let location: NationalParkLocation
    @State private var animation: Double = 0.0

    // MARK: - BODY

    var body: some View {
        ZStack {
            Circle()
                .fill(.accent)
                .frame(width: 54, height: 54)

            Circle()
                .stroke(Color.accentColor, lineWidth: 2)
                .frame(width: 52, height: 52)
                .scaleEffect(1 + CGFloat(animation))
                .opacity(1 - animation)

            Image(location.image)
                .resizable()
                .scaledToFit()
                .frame(width: 48, height: 48)
                .clipShape(Circle())
        } //: ZSTACK
        .onAppear {
            withAnimation(.easeOut(duration: 2).repeatForever(autoreverses: false)) {
                animation = 1
            }
        }
    }
}

// MARK: - PREVIEW

#Preview {
    MapAnnonationView(location: NationalParkLocation.nationalParkLocations[0])
}

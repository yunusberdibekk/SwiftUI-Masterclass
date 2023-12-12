//
//  FeaturedItemView.swift
//  TouchDown
//
//  Created by Yunus Emre Berdibek on 8.10.2023.
//

import SwiftUI

struct FeaturedItemView: View {
    // MARK: - PROPERTY

    let player: Player

    // MARK: - BODY

    var body: some View {
        Image(player.image)
            .resizable()
            .scaledToFit()
            .cornerRadius(12)
    }
}

// MARK: - PREVIEW

#Preview {
    FeaturedItemView(player: players[0])
}

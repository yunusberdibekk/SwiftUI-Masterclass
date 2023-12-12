//
//  HeadingView.swift
//  Africa
//
//  Created by Yunus Emre Berdibek on 5.10.2023.
//

import SwiftUI

struct HeadingView: View {
    // MARK: - PROPERTIES

    let headingImage: String
    let headingText: String

    // MARK: - BODY

    var body: some View {
        HStack {
            Image(systemName: headingImage)
                .foregroundStyle(.accent)
                .imageScale(.large)

            Text(headingText)
                .font(.title3)
                .fontWeight(.bold)
        }
        .padding(.vertical)
    }
}

// MARK: - PREVIEW

#Preview {
    HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness in pictures")
}

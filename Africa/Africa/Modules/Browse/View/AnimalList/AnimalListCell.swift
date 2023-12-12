//
//  AnimalListItemView.swift
//  Africa
//
//  Created by Yunus Emre Berdibek on 5.10.2023.
//

import SwiftUI

struct AnimalListCell: View {
    // MARK: - PROPERTIES

    let animal: Animal

    // MARK: - BODY

    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            Image(animal.image)
                .resizable()
                .scaledToFill()
                .frame(width: 90, height: 90)
                .clipShape(RoundedRectangle(cornerRadius: 12))

            VStack(alignment: .leading, spacing: 8) {
                Text(animal.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundStyle(.accent)

                Text(animal.headline)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .padding(.trailing, 8)
            } //: VSTACK
        } //: HSTACK
    }
}

// MARK: - PREVIEW

#Preview {
    AnimalListCell(animal: Animal.animals[0])
}

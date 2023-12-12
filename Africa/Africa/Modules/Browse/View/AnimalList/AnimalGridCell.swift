//
//  AnimalGridItemView.swift
//  Africa
//
//  Created by Yunus Emre Berdibek on 7.10.2023.
//

import SwiftUI

struct AnimalGridCell: View {
    // MARK: - PROPERTIES

    let animal: Animal

    // MARK: - BODY

    var body: some View {
        Image(animal.image)
            .resizable()
            .scaledToFit()
            .clipShape(.rect(cornerRadius: 12))
    }
}

// MARK: PREVIEW

#Preview {
    AnimalGridCell(animal: Animal.animals[0])
}

//
//  BrandItemView.swift
//  TouchDown
//
//  Created by Yunus Emre Berdibek on 8.10.2023.
//

import SwiftUI

struct BrandItemView: View {
    // MARK: - PROPERTIES

    let brand: Brand

    // MARK: - BODY

    var body: some View {
        Image(brand.image)
            .resizable()
            .scaledToFit()
            .padding(3)
            .background(Color.white.clipShape(.rect(cornerRadius: 12)))
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.gray, lineWidth: 1)
            )
    }
}

// MARK: - PREVIEW

#Preview {
    BrandItemView(brand: brands[0])
        .padding()
        .background(colorBackground)
}

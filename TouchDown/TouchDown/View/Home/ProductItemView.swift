//
//  ProductItemView.swift
//  TouchDown
//
//  Created by Yunus Emre Berdibek on 8.10.2023.
//

import SwiftUI

struct ProductItemView: View {
    // MARK: - PROPERTIES

    let product: Product

    // MARK: - BODY

    var body: some View {
        VStack(alignment: .leading, spacing: 6, content: {
            // PHOTO
            ZStack(content: {
                Image(product.image)
                    .resizable()
                    .scaledToFit()
                    .padding(10)
            }) //: ZSTACK
            .background(product.customColor)
            .clipShape(.rect(cornerRadius: 12))

            // NAME
            Text(product.name)
                .font(.title3)
                .fontWeight(.black)

            // PRICE
            Text(product.formattedPrice)
                .fontWeight(.semibold)
                .foregroundStyle(.gray)
        }) //: VSTACK
    }
}

// MARK: - PREVIEW

#Preview {
    ProductItemView(product: products[0])
        .padding()
        .background(colorBackground)
}

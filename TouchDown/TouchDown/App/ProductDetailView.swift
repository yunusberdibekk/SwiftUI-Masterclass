//
//  ProductDetailView.swift
//  TouchDown
//
//  Created by Yunus Emre Berdibek on 8.10.2023.
//

import SwiftUI

struct ProductDetailView: View {
    // MARK: - PROPERTIES

    @EnvironmentObject var shop: Shop

    // MARK: - BODY

    var body: some View {
        VStack(alignment: .leading, spacing: 5, content: {
            // NAVBAR
            NavigationBarDetailView()
                .padding(.horizontal)
                .padding(.top)

            // HEADER
            HeaderDetailView()
                .padding(.horizontal)

            // DETAIL TOP PART
            TopPartDetailView()
                .padding(.horizontal)
                .zIndex(1)

            // DETAIL BUTTON PART
            VStack(alignment: .center, spacing: 0, content: {
                // RATINGS + SIZES
                RatingSizesDetailView()
                    .padding(.top, -20)
                    .padding(.bottom, 10)

                // DESCRIPTON
                ScrollView(.vertical, showsIndicators: false, content: {
                    Text(shop.selectedProduct?.description ?? sampleProduct.description)
                        .font(.body)
                        .foregroundStyle(.gray)
                        .multilineTextAlignment(.leading)
                }) //: SCROLL VIEW

                // QUANTITY + FAVORITE
                QuantitiyFavouriteView()
                    .padding(.vertical, 10)

                // ADD TO CART
                AddToCardDetailView()
                    .padding(.bottom, 20)
            }) //: VSTACK
            .padding(.horizontal)
            .background(
                Color.white
                    .clipShape(CustomShape())
                    .padding(.top, -105)
            )

        }) //: VSTACK
        .zIndex(0)
        .ignoresSafeArea(.all, edges: .bottom)
        .background(
            Color(
                shop.selectedProduct?.customColor ?? sampleProduct.customColor
            )
            .ignoresSafeArea(.all, edges: .all)
        )
    }
}

// MARK: - PREVIEW

#Preview {
    ProductDetailView()
        .environmentObject(Shop())
        .previewLayout(.fixed(width: 375, height: 812))
}

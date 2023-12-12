//
//  TopPartDetailView.swift
//  TouchDown
//
//  Created by Yunus Emre Berdibek on 8.10.2023.
//

import SwiftUI

struct TopPartDetailView: View {
    // MARK: - PROPERTIES

    @EnvironmentObject var shop: Shop
    @State private var isAnimating: Bool = false

    // MARK: - BODY

    var body: some View {
        HStack(alignment: .center, spacing: 6, content: {
            // PRICE
            VStack(alignment: .leading, spacing: 6, content: {
                Text("Price")
                    .fontWeight(.semibold)

                Text(shop.selectedProduct?.formattedPrice ?? sampleProduct.formattedPrice)
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .scaleEffect(1.35, anchor: .leading)
            }) //: VSTACK
            .offset(y: isAnimating ? -50 : -75)

            Spacer()

            // PHOTO
            Image(shop.selectedProduct?.image ?? sampleProduct.image)
                .resizable()
                .scaledToFit()
                .offset(y: isAnimating ? 0 : -35)

        }) //: HSTACK
        .onAppear(perform: {
            withAnimation(.easeOut(duration: 0.75)) {
                isAnimating.toggle()
            }
        })
    }
}

// MARK: - PREVIEW

#Preview {
    TopPartDetailView()
        .environmentObject(Shop())
        .padding()
}

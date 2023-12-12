//
//  HeaderDetailView.swift
//  TouchDown
//
//  Created by Yunus Emre Berdibek on 8.10.2023.
//

import SwiftUI

struct HeaderDetailView: View {
    // MARK: - PROPERTIES

    @EnvironmentObject var shop: Shop

    // MARK: - BODY

    var body: some View {
        VStack(alignment: .leading, spacing: 6, content: {
            Text("Protective Gear")

            Text(shop.selectedProduct?.name ?? sampleProduct.name)
                .font(.largeTitle)
                .fontWeight(.black)
        }) //: VSTACK
        .foregroundStyle(.white)
    }
}

// MARK: - PREVIEW

#Preview {
    HeaderDetailView()
        .environmentObject(Shop())
        .padding()
        .background(.gray)
}

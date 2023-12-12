//
//  AddToCardDetailView.swift
//  TouchDown
//
//  Created by Yunus Emre Berdibek on 8.10.2023.
//

import SwiftUI

struct AddToCardDetailView: View {
    // MARK: - PROPERTIES

    @EnvironmentObject var shop: Shop

    // MARK: - BODY

    var body: some View {
        Button(action: {
            feedBack.impactOccurred()
        }, label: {
            Spacer()
            Text("Add to card".uppercased())
                .font(.system(.title2, design: .rounded))
                .fontWeight(.bold)
                .foregroundStyle(.white)
            Spacer()
        }) //: BUTTON
        .padding(15)
        .background(
            shop.selectedProduct?.customColor ?? sampleProduct.customColor
        )
        .clipShape(Capsule())
    }
}

// MARK: - PREVIEW

#Preview {
    AddToCardDetailView()
        .environmentObject(Shop())
        .padding()
}

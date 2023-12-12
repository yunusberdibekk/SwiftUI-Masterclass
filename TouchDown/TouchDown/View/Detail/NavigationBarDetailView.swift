//
//  NavigationBarDetailView.swift
//  TouchDown
//
//  Created by Yunus Emre Berdibek on 8.10.2023.
//

import SwiftUI

struct NavigationBarDetailView: View {
    // MARK: - PROPERTIES

    @EnvironmentObject var shop: Shop

    // MARK: - BODY

    var body: some View {
        HStack(content: {
            Button(action: {
                withAnimation(.easeOut) {
                    feedBack.impactOccurred()

                    shop.selectedProduct = nil
                    shop.showingProduct = false
                }
            }, label: {
                Image(systemName: "chevron.left")
                    .font(.title)
                    .foregroundStyle(.white)
            }) //: BUTTON

            Spacer()

            Button(action: {}, label: {
                Image(systemName: "cart")
                    .font(.title)
                    .foregroundStyle(.white)
            }) //: BUTTON
        }) //: HSTACK
    }
}

// MARK: - PREVIEW

#Preview {
    NavigationBarDetailView()
        .environmentObject(Shop())
        .padding()
        .background(.gray)
}

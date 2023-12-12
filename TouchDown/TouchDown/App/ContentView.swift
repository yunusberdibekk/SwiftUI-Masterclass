//
//  ContentView.swift
//  TouchDown
//
//  Created by Yunus Emre Berdibek on 8.10.2023.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES

    @EnvironmentObject var shop: Shop

    // MARK: - BODY

    var body: some View {
        ZStack {
            if shop.showingProduct == false && shop.selectedProduct == nil {
                VStack(spacing: 0) {
                    NavigationBarView()
                        .padding(.horizontal, 15)
                        .padding(.bottom)
                        .background(Color.white)

                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(spacing: 0) {
                            FeaturedTabView()
                                .padding(.vertical)
                                .frame(height: UIScreen.main.bounds.width / 1.475) // This will fix the layout rendering priority issue by using the screen's aspect ratio.
                                .padding(.vertical, 20)

                            CategoryGridView()

                            TitleView(title: "Helmets")

                            LazyVGrid(columns: gridLayout, spacing: 15, content: {
                                ForEach(products) { product in
                                    ProductItemView(product: product)
                                        .onTapGesture {
                                            withAnimation(.easeOut) {
                                                feedBack.impactOccurred()
                                                
                                                shop.selectedProduct = product
                                                shop.showingProduct = true
                                            }
                                        }
                                } //: LOOP
                            }) //: GRID
                            .padding(15)

                            TitleView(title: "Brands")

                            BrandGridView()

                            FooterView()
                                .padding()
                        }
                    } //: SCROLL VIEW
                } //: VSTACK
                .background(.colorBackground)
            } else {
                ProductDetailView()
            }
        } //: ZSTACK
    }
}

// MARK: - PREVIEW

#Preview {
    ContentView()
        .environmentObject(Shop())
}

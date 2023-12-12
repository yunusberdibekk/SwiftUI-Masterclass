//
//  BrandGridView.swift
//  TouchDown
//
//  Created by Yunus Emre Berdibek on 8.10.2023.
//

import SwiftUI

struct BrandGridView: View {
    // MARK: - PROPERTIES

    // MARK: - BODY

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false, content: {
            LazyHGrid(rows: gridLayout, spacing: columnSpacing, content: {
                ForEach(brands) { brand in
                    BrandItemView(brand: brand)
                }
            }) //: GRID
            .frame(height: 200)
            .padding(15)
        }) //: SCROLL VIEW
    }
}

// MARK: - PREVIEW

#Preview {
    BrandGridView()
        .background(colorBackground)
}

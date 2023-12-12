//
//  CoverImageView.swift
//  Africa
//
//  Created by Yunus Emre Berdibek on 5.10.2023.
//

import SwiftUI

struct CoverImageView: View {
    // MARK: - PROPERTIES

    // MARK: - BODY

    var body: some View {
        TabView {
            ForEach(CoverImage.coverImages) { item in
                Image(item.name)
                    .resizable()
                    .scaledToFill()
            } //: LOOP
        } //: TAB
        .tabViewStyle(PageTabViewStyle())
    }
}

// MARK: - PREVIEW

#Preview {
    CoverImageView()
}

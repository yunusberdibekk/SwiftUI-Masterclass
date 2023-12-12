//
//  InsetGalleryView.swift
//  Africa
//
//  Created by Yunus Emre Berdibek on 5.10.2023.
//

import SwiftUI

struct InsetGalleryView: View {
    // MARK: - PROPERTIES

    let animal: Animal

    // MARK: - BODY

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 15) {
                ForEach(animal.gallery, id: \.self) { item in
                    Image(item)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .clipShape(.rect(cornerRadius: 12))
                }
            } //: HSTACK
        } //: SCROLLVIEW
    }
}

// MARK: - PREVIEW

#Preview {
    InsetGalleryView(animal: Animal.animals[0])
}

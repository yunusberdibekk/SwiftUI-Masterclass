//
//  CategoryItemView.swift
//  TouchDown
//
//  Created by Yunus Emre Berdibek on 8.10.2023.
//

import SwiftUI

struct CategoryItemView: View {
    // MARK: - PROPERTIES

    let category: Category

    // MARK: - BODY

    var body: some View {
        Button(action: {}, label: {
            HStack(alignment: .center, spacing: 6, content: {
                Image(category.image)
                    .renderingMode(.template)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30, alignment: .center)
                    .foregroundStyle(.gray)

                Text(category.name.uppercased())
                    .fontWeight(.light)
                    .foregroundStyle(.gray)

                Spacer()
            }) //: HSTACK
            .padding()
            .background(
                Color.white.clipShape(.rect(cornerRadius: 12)))
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(.gray, lineWidth: 1))
        }) //: BUTTON
    }
}

// MARK: - PREVIEW

#Preview {
    CategoryItemView(category: categories[0])
        .padding( )
}

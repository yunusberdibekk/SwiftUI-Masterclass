//
//  RatingSizesDetailView.swift
//  TouchDown
//
//  Created by Yunus Emre Berdibek on 8.10.2023.
//

import SwiftUI

struct RatingSizesDetailView: View {
    // MARK: - PROPERTIES

    let sizes: [String] = ["XS", "S", "M", "L", "XL"]

    // MARK: - BODY

    var body: some View {
        HStack(alignment: .top, spacing: 3, content: {
            // RATINGS
            VStack(alignment: .leading, spacing: 3, content: {
                Text("Ratings")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundStyle(colorGray)

                HStack(alignment: .center, spacing: 3, content: {
                    ForEach(1 ... 5, id: \.self) { _ in
                        Button(action: {}, label: {
                            Image(systemName: "star.fill")
                                .frame(width: 28, height: 28, alignment: .center)
                                .background(
                                    colorGray
                                        .clipShape(.rect(cornerRadius: 5))
                                )
                                .foregroundStyle(.white)
                        }) //: BUTTON
                    }
                }) //: HSTACK
            })
            //: VSTACK

            Spacer()

            // SIZES

            VStack(alignment: .trailing, spacing: 3, content: {
                Text("Sizes")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundStyle(colorGray)

                HStack(alignment: .center, spacing: 5, content: {
                    ForEach(sizes, id: \.self) { size in
                        Text(size)
                            .font(.footnote)
                            .fontWeight(.black)
                            .foregroundStyle(colorGray)
                            .frame(width: 28, height: 28, alignment: .center)
                            .background(
                                Color.white
                                    .clipShape(.rect(cornerRadius: 5))
                            )
                            .background(RoundedRectangle(cornerRadius: 5)
                                .stroke(colorGray, lineWidth: 2)
                            )
                    }
                }) //: HSTACK
            }) //: VSTACK
        }) //: HSTACK
    }
}

// MARK: - PREVIEW

#Preview {
    RatingSizesDetailView()
        .padding()
}

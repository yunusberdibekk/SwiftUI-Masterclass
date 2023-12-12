//
//  TitleView.swift
//  TouchDown
//
//  Created by Yunus Emre Berdibek on 8.10.2023.
//

import SwiftUI

struct TitleView: View {
    // MARK: - PROPERTIES

    let title: String

    // MARK: - BODY

    var body: some View {
        HStack {
            Text(title)
                .font(.largeTitle)
                .fontWeight(.heavy)

            Spacer()
        } //: HSTACK
        .padding(.horizontal)
        .padding(.top, 15)
        .padding(.bottom, 10)
    }
}

// MARK: - PREVIEW

#Preview {
    TitleView(title: "Helmet")
        .background(.colorBackground)
}

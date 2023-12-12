//
//  BlankView.swift
//  Devote
//
//  Created by Yunus Emre Berdibek on 10.10.2023.
//

import SwiftUI

struct BlankView: View {
    // MARK: - PROPERTIES

    var backgroundColor: Color
    var backgroundOpacity: Double

    // MARK: - BODY

    var body: some View {
        VStack(content: {
            Spacer()
        }) //: VSTACK
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, idealHeight: .infinity, alignment: .center)
        .background(backgroundColor)
        .opacity(backgroundOpacity)
        .blendMode(.overlay)
        .ignoresSafeArea()
    }
}

// MARK: - PREVIEW

#Preview {
    BlankView(backgroundColor: Color.black, backgroundOpacity: 0.3)
        .background(BackgroundImageView())
        .background(backgroundGradient.ignoresSafeArea(.all))
}

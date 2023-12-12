//
//  StartButtonView.swift
//  Fructus
//
//  Created by Yunus Emre Berdibek on 3.10.2023.
//

import SwiftUI

struct StartButtonView: View {
    // MARK: - PROPERTIES

    @AppStorage("isOnboarding") var isOnboarding: Bool?

    // MARK: - BODY

    var body: some View {
        Button {
            isOnboarding = false
        } label: {
            HStack(spacing: 8) {
                Text("Start")
                    .padding()

                Image(systemName: "arrow.right.circle")
                    .imageScale(.large)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            .background(
                Capsule()
                    .strokeBorder(Color.white, lineWidth: 1.25)
            )
        }
        .tint(.white)
    }
}

// MARK: PREVIEW

#Preview {
    StartButtonView()
}

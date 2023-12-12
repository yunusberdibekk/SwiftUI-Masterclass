//
//  CreditsView.swift
//  Africa
//
//  Created by Yunus Emre Berdibek on 7.10.2023.
//

import SwiftUI

struct CreditsView: View {
    var body: some View {
        VStack {
            Image(.compass)
                .resizable()
                .scaledToFit()
                .frame(width: 128, height: 128)

            Text("""
            Copyright ©
            All right reserved
            Better Apps ❤️ Less Code
            """)
            .font(.footnote)
            .multilineTextAlignment(.center)
        } //: VSTACK
        .padding()
        .opacity(0.4)
    }
}

#Preview {
    CreditsView()
}

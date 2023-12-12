//
//  BackgroundImageView.swift
//  Devote
//
//  Created by Yunus Emre Berdibek on 10.10.2023.
//

import SwiftUI

struct BackgroundImageView: View {
    var body: some View {
        Image(.rocket)
            .antialiased(true)
            .resizable()
            .scaledToFill()
            .ignoresSafeArea(.all)
    }
}

#Preview {
    BackgroundImageView()
}

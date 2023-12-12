//
//  ControlImageView.swift
//  Pinch
//
//  Created by Yunus Emre Berdibek on 2.10.2023.
//

import SwiftUI

struct ControlImageView: View {
    let icon: String

    var body: some View {
        Image(systemName: icon)
            .font(.system(size: 36))
    }
}

#Preview {
    ControlImageView(icon: "minus.magnifyingglass")
}

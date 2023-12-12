//
//  SettingsLabelView.swift
//  Fructus
//
//  Created by Yunus Emre Berdibek on 4.10.2023.
//

import SwiftUI

struct SettingsLabelView: View {
    // MARK: - PROPERTIES

    let labelText: String
    let labelImage: String

    // MARK: BODY

    var body: some View {
        HStack {
            Text(labelText.uppercased())
                .fontWeight(.bold)
            Spacer()
            Image(systemName: labelImage)
        }
    }
}

// MARK: - PREVIEW

#Preview {
    SettingsLabelView(labelText: "Fructus", labelImage: "info.circle")
}

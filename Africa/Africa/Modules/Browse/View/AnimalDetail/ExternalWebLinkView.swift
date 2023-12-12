//
//  ExternalWebLinkView.swift
//  Africa
//
//  Created by Yunus Emre Berdibek on 6.10.2023.
//

import SwiftUI

struct ExternalWebLinkView: View {
    // MARK: - PROPERTIES

    let animal: Animal

    // MARK: - BODY

    var body: some View {
        GroupBox {
            HStack {
                Image(systemName: "globe")
                Text("Wikipedia")
                Spacer()

                Group {
                    Image(systemName: "arrow.up.right.square")

                    Link(animal.name, destination: (URL(string: animal.link) ?? URL(string: "https://wikipedia.org"))!)
                }
                .foregroundColor(.accentColor)
            } //: HSTACK
        } //: BOX
    }
}

// MARK: PREVIEW

#Preview {
    ExternalWebLinkView(animal: Animal.animals[0])
}

//
//  SourceLinkView.swift
//  Fructus
//
//  Created by Yunus Emre Berdibek on 3.10.2023.
//

import SwiftUI

struct SourceLinkView: View {
    var body: some View {
        GroupBox {
            HStack {
                Text("Content Source")
                Spacer()
                Link("Wikipedia", destination: URL(string: "https://wikipedia.com")!)
                Image(systemName: "arrow.up.right.square")
            }
            .font(.footnote)
        }
    }
}

#Preview {
    SourceLinkView()
}

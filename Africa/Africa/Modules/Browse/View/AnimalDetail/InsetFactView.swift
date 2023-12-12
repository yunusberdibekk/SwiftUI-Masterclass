//
//  InsetFactView.swift
//  Africa
//
//  Created by Yunus Emre Berdibek on 5.10.2023.
//

import SwiftUI

struct InsetFactView: View {
    // MARK: - PROPERTIES

    let animal: Animal

    // MARK: - BODY

    var body: some View {
        GroupBox {
            TabView {
                ForEach(animal.fact, id: \.self) { item in
                    Text(item)
                }
            } //: TABVIEW
            .tabViewStyle(PageTabViewStyle())
            .frame(minHeight: 148, idealHeight: 168, maxHeight: 180)
        } //: BOX
    }
}

// MARK: - PREVIEW

#Preview {
    InsetFactView(animal: Animal.animals[0])
}

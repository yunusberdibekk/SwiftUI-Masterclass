//
//  FruitDetailView.swift
//  Fructus
//
//  Created by Yunus Emre Berdibek on 3.10.2023.
//

import SwiftUI

struct FruitDetailView: View {
    // MARK: - PROPERTIES

    let fruit: Fruit

    // MARK: - BODY

    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: /*@START_MENU_TOKEN@*/ .center/*@END_MENU_TOKEN@*/, spacing: 20) {
                    // HEADER
                    FruitHeaderView(fruit: fruit)

                    VStack(alignment: .leading, spacing: 20) {
                        // TITLE
                        Text(fruit.title)
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .foregroundStyle(fruit.gradientColors[1])

                        // HEADLINE
                        Text(fruit.headline)
                            .font(.headline)
                            .multilineTextAlignment(.leading)

                        // NUTRIENS
                        FruitNutriensView(fruit: fruit)

                        // SUBHEADING
                        Text("Learn more about \(fruit.title.uppercased())")
                            .fontWeight(.bold)
                            .foregroundStyle(fruit.gradientColors[1])

                        // DESCRIPTION
                        Text(fruit.description)
                            .multilineTextAlignment(.leading)

                        // LINK
                        SourceLinkView()
                            .padding(.top, 10)
                            .padding(.bottom, 40)
                    } //: VSTACK
                    .padding(.horizontal)
                    .frame(maxWidth: 640, alignment: .center)
                } //: VSTACK
                .navigationTitle(fruit.title)
                .navigationBarTitleDisplayMode(.inline)
            } //: SCROOL
            .ignoresSafeArea()
        } //: NAVSTACK
    }
}

// MARK: PREVIEW

#Preview {
    NavigationStack {
        FruitDetailView(fruit: fruitsData[0])
    }
}

//
//  FruitNutriensView.swift
//  Fructus
//
//  Created by Yunus Emre Berdibek on 4.10.2023.
//

import SwiftUI

struct FruitNutriensView: View {
    // MARK: - PROPERTIES

    let fruit: Fruit
    let nutriens: [String] = ["Energy,", "Sugar", "Fat", "Protein", "Vitamins", "Minerals"]

    // MARK: - BODY

    var body: some View {
        GroupBox {
            DisclosureGroup("Nutritional value per 100") {
                ForEach(0 ..< nutriens.count, id: \.self) { item in
                    Divider()
                        .padding(.vertical, 2)

                    HStack {
                        Group {
                            Image(systemName: "info.circle")
                            Text(nutriens[item])
                        }
                        .foregroundStyle(fruit.gradientColors[1])
                        .font(.body.bold())

                        Spacer(minLength: 25)

                        Text(fruit.nutrition[item])
                            .multilineTextAlignment(.trailing)
                    }
                }
            }
        } //: BOX
    }
}

// MARK: - PREVIEW

#Preview {
    FruitNutriensView(fruit: fruitsData[0])
}

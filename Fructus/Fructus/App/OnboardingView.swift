//
//  OnboardingView.swift
//  Fructus
//
//  Created by Yunus Emre Berdibek on 3.10.2023.
//

import SwiftUI

struct OnboardingView: View {
    // MARK: - PROPERTIES

    var fruits: [Fruit] = fruitsData

    // MARK: - BODY

    var body: some View {
        TabView {
            ForEach(fruits) { item in
                FruitCardView(fruit: item)
            }
        } //: TAB
        .tabViewStyle(PageTabViewStyle())
        .padding(.vertical, 20)
    }
}

// MARK: - PREVIEW

#Preview {
    OnboardingView()
}

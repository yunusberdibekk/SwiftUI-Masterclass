//
//  ContentView.swift
//  Restart
//
//  Created by Yunus Emre Berdibek on 1.10.2023.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("onboarding") var isOnoboardingViewActive: Bool = true

    var body: some View {
        ZStack {
            if isOnoboardingViewActive {
                OnboardingView()
            } else {
                HomeView()
            }
        }
    }
}

#Preview {
    ContentView()
}

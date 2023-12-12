//
//  HomeView.swift
//  Restart
//
//  Created by Yunus Emre Berdibek on 1.10.2023.
//

import SwiftUI

struct HomeView: View {
    // MARK: - PROPERTY

    /// Değeri burada set etmiyoruz. Eğer değer var ise okuyoruz. Daha önceden set edilmiş ise.
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = false
    @State private var isAnimating: Bool = false

    // MARK: - BODY

    var body: some View {
        VStack(spacing: 20) {
            // MARK: - HEADER

            Spacer()

            ZStack {
                CircleGroupView(ShapeColor: .gray, ShapeOpacity: 0.1)

                Image(.character2)
                    .resizable()
                    .scaledToFit()
                    .padding()
                    .offset(y: isAnimating ? 35 : -35)
                    .animation(
                        Animation
                            .easeInOut(duration: 4)
                            .repeatForever(),
                        value: isAnimating
                    )
            } //: ZSTACK

            // MARK: - CENTER

            Text("The time that leads to mastery is dependent on the intensity of our focus.")
                .font(.title3)
                .fontWeight(.light)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
                .padding()

            // MARK: - FOOTER

            Spacer()

            Button {
                withAnimation {
                    playSound(sound: "success", type: "m4a")
                    isOnboardingViewActive = true
                }
            } label: {
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                    .imageScale(.large)

                Text("Restart")
                    .font(.system(.title3, design: .rounded))
                    .fontWeight(.bold)
            } //: Button
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
        } //: VSTACK
        .onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                isAnimating = true
            }
        })
    }
}

#Preview {
    HomeView()
}

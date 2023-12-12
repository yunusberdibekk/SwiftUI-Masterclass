//
//  OnboardingView.swift
//  Restart
//
//  Created by Yunus Emre Berdibek on 1.10.2023.
//

import SwiftUI

struct OnboardingView: View {
    // MARK: - PROPERTY
    
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    @State private var buttonWidth: Double = UIScreen.main.bounds.width - 80
    @State private var buttonOffsets: CGFloat = 0
    @State private var isAnimating: Bool = false
    @State private var imageOffset: CGSize = .zero
    @State private var indicatorOpacity: Double = 1.0
    @State private var textTitle: String = "Share."
    
    let hapticFeedback = UINotificationFeedbackGenerator()
    
    // MARK: - BODY
    
    var body: some View {
        ZStack {
            Color(.colorBlue)
                .ignoresSafeArea(.all, edges: .all)
            
            VStack(spacing: 20) {
                // MARK: - HEADER
                
                Spacer()
                
                VStack(spacing: 8) {
                    Text(textTitle)
                        .font(.system(size: 60))
                        .fontWeight(.heavy)
                        .foregroundStyle(.white)
                        .transition(.opacity)
                        .id(textTitle)
                    
                    Text("""
                    It's not have much we give but
                    how much love we put into giving.
                    """)
                    .font(.title3)
                    .fontWeight(.light)
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 10)
                } //: HEADER
                .opacity(isAnimating ? 1 : 0)
                .offset(y: isAnimating ? 0 : -40)
                .animation(.easeOut(duration: 1), value: isAnimating)

                // MARK: - CENTER
                
                ZStack {
                    CircleGroupView(ShapeColor: .white, ShapeOpacity: 0.2)
                        .offset(x: imageOffset.width * -1)
                        .blur(radius: abs(imageOffset.width / 5))
                        .animation(.easeOut(duration: 1), value: imageOffset)
                    
                    Image(.character1)
                        .resizable()
                        .scaledToFit()
                        .opacity(isAnimating ? 1 : 0)
                        .animation(.easeInOut(duration: 0.5), value: isAnimating)
                        .offset(x: imageOffset.width * 1.2)
                        .rotationEffect(.degrees(Double(imageOffset.width / 20)))
                        .gesture(
                            DragGesture()
                                .onChanged { gesture in
                                    if abs(imageOffset.width) <= 150 {
                                        imageOffset = gesture.translation
                                        
                                        withAnimation(.linear(duration: 0.25)) {
                                            indicatorOpacity = 0
                                            textTitle = "Give."
                                        }
                                    }
                                }
                                .onEnded { _ in
                                    imageOffset = .zero
                                    
                                    withAnimation(.linear(duration: 0.25)) {
                                        indicatorOpacity = 1
                                        textTitle = "Share."
                                    }
                                }
                        ) //: GESTURE
                        .animation(.easeOut(duration: 1), value: imageOffset)
                } //: CENTER
                .overlay(
                    Image(systemName: "arrow.left.and.right.circle")
                        .font(.system(size: 44, weight: .ultraLight))
                        .foregroundStyle(.white)
                        .offset(y: 20)
                        .opacity(isAnimating ? 1 : 0)
                        .animation(.easeOut(duration: 1).delay(2), value: isAnimating)
                        .opacity(indicatorOpacity),
                    alignment: .bottom
                )
                
                Spacer()
                
                // MARK: - FOOTER
                
                ZStack {
                    // PARTS OF CUSTOM BUTTON
                    Capsule()
                        .fill(Color.white.opacity(0.2))
                    
                    Capsule()
                        .fill(Color.white.opacity(0.2))
                        .padding(8)
                    
                    Text("Get Started")
                        .font(.system(.title3, design: .rounded, weight: .bold))
                        .foregroundStyle(.white)
                        .offset(x: 20)
                    
                    HStack {
                        Capsule()
                            .fill(Color(.colorRed))
                            .frame(width: buttonOffsets + 80)
                        
                        Spacer()
                    }
                    
                    HStack {
                        ZStack {
                            Circle()
                                .fill(Color(.colorRed))
                            
                            Circle()
                                .fill(.black.opacity(0.15))
                                .padding(8)
                            
                            Image(systemName: "chevron.right.2")
                                .font(.system(size: 24, weight: .bold))
                        }
                        .foregroundStyle(.white)
                        .frame(width: 80, height: 80, alignment: .center)
                        .offset(x: buttonOffsets)
                        .gesture(
                            DragGesture()
                                .onChanged { gesture in
                                    withAnimation(.easeOut(duration: 0.4)) {
                                        if gesture.translation.width > 0, buttonOffsets <= buttonWidth - 80 {
                                            buttonOffsets = gesture.translation.width
                                        }
                                    }
                                }
                                .onEnded { _ in
                                    if buttonOffsets > buttonWidth / 2 {
                                        hapticFeedback.notificationOccurred(.success)
                                        playSound(sound: "chimeup", type: "mp3")
                                        buttonOffsets = buttonWidth - 80
                                        isOnboardingViewActive = false
                                    } else {
                                        hapticFeedback.notificationOccurred(.warning)
                                        buttonOffsets = 0
                                    }
                                }
                        ) //: GESTURE
                        Spacer()
                    } //: HSTACK
                } //: FOOTER
                .frame(width: buttonWidth, height: 80, alignment: .center)
                .padding()
                .opacity(isAnimating ? 1 : 0)
                .offset(y: isAnimating ? 0 : 40)
                .animation(.easeOut(duration: 1), value: isAnimating)
            } //: VSTACK
        } //: ZSTACK
        .onAppear(perform: {
            isAnimating = true
        })
    }
}

#Preview {
    OnboardingView()
}

/*
 .onTapGesture {
 isOnboardingViewActive = false
 }
 */

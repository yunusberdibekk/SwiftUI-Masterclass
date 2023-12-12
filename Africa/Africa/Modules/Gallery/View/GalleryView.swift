//
//  GalleryView.swift
//  Africa
//
//  Created by Yunus Emre Berdibek on 5.10.2023.
//

import SwiftUI

struct GalleryView: View {
    // MARK: - PROPERTIES

    @State private var selectedAnimal: String = "lion"
    let animals: [Animal] = Bundle.main.decode("animals.json")
    let haptics = UIImpactFeedbackGenerator(style: .medium)

    // EFFICIENT GRID DEFINITION
    // let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)

    // DYNAMIC GRID DEFINITION
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Double = 3.0

    // MARK: - FUNCTIONS

    func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColumn))
    }

    // MARK: - BODY

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 30) {
                // MARK: IMAGE

                Image(selectedAnimal)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(.white, lineWidth: 8)
                    )

                // MARK: SLIDER

                Slider(value: $gridColumn, in: 2 ... 4, step: 1)
                    .padding(.horizontal)
                    .onChange(of: gridColumn) { _, _ in
                        withAnimation(.easeIn) {
                            gridSwitch()
                        }
                    }

                // MARK: GRID

                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                    ForEach(animals) { animal in
                        Image(animal.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(
                                Circle()
                                    .stroke(.white, lineWidth: 1)
                            )
                            .onTapGesture {
                                selectedAnimal = animal.image
                                haptics.impactOccurred()
                            }
                    } //: LOOP
                } //: GRID
                .onAppear {
                    gridSwitch()
                }
            } //: VSTACK
            .padding(.horizontal, 10)
            .padding(.vertical, 15)
        } //: SCROLL
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(MotionAnimationView())
    }
}

// MARK: - PREVIEW

#Preview {
    GalleryView()
}

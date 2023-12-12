//
//  AnimalDetailView.swift
//  Africa
//
//  Created by Yunus Emre Berdibek on 5.10.2023.
//

import SwiftUI

struct AnimalDetailView: View {
    // MARK: - PROPERTIES

    let animal: Animal

    // MARK: - BODY

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 20) {
                // HERO IMAGE
                Image(animal.image)
                    .resizable()
                    .scaledToFit()

                // TITLE
                Text(animal.name.uppercased())
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 8)
                    .foregroundStyle(.primary)
                    .background(
                        Color.accentColor
                            .frame(height: 6)
                            .offset(y: 24)
                    )

                // HEADLINE
                Text(animal.headline)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .foregroundStyle(.accent)
                    .padding(.horizontal)

                // GALLERY
                Group {
                    HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness in Pictures")

                    InsetGalleryView(animal: animal)
                }
                .padding(.horizontal)

                // FACTS
                Group {
                    HeadingView(headingImage: "questionmark.circle", headingText: "Did you know?")

                    InsetFactView(animal: animal)
                }
                .padding(.horizontal)

                // DESCRIPTION
                Group {
                    HeadingView(headingImage: "info.circle", headingText: "All about \(animal.name)")

                    Text(animal.description)
                        .multilineTextAlignment(.leading)
                        .layoutPriority(1)
                }
                .padding(.horizontal)

                // MAP
                Group {
                    HeadingView(headingImage: "map", headingText: "National Parks")

                    InsetMapView()
                }
                .padding(.horizontal)

                // LINK
                Group {
                    HeadingView(headingImage: "books.vertical", headingText: "Learn More")

                    ExternalWebLinkView(animal: animal)
                }
                .padding(.horizontal)
            } //: VSTACK
            .navigationTitle("Learn about \(animal.name)")
            .navigationBarTitleDisplayMode(.inline)
        } //: SCROLLVIEW
    }
}

// MARK: - PREVIEW

#Preview {
    NavigationStack {
        AnimalDetailView(animal: Animal.animals[0])
    }
}

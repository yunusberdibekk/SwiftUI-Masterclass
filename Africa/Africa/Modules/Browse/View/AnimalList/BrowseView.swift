//
//  ContentView.swift
//  Africa
//
//  Created by Yunus Emre Berdibek on 5.10.2023.
//

import SwiftUI

struct BrowseView: View {
    // MARK: - PROPERTIES

    @State private var isGridViewActive: Bool = false
    let haptics = UIImpactFeedbackGenerator(style: .medium)

    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Int = 1
    @State private var toolbarIcon: String = "square.grid.2x2"

    // MARK: - FUNCTIONS

    func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)
        gridColumn = gridLayout.count

        switch gridColumn {
        case 1:
            toolbarIcon = "square.grid.2x2"
        case 2:
            toolbarIcon = "square.grid.3x2"
        case 3:
            toolbarIcon = "rectangle.grid.1x2"
        default:
            toolbarIcon = "square.grid.2x2"
        }
    }

    // MARK: - BODY

    var body: some View {
        NavigationStack {
            Group {
                if !isGridViewActive {
                    List {
                        CoverImageView()
                            .frame(height: 300)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))

                        ForEach(Animal.animals) { animal in
                            NavigationLink {
                                AnimalDetailView(animal: animal)
                            } label: {
                                AnimalListCell(animal: animal)
                            }
                        } //: LOOP

                        CreditsView()
                            .modifier(CenterModifier())
                    } //: LIST
                } else {
                    ScrollView {
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                            ForEach(Animal.animals) { animal in
                                NavigationLink {
                                    AnimalDetailView(animal: animal)
                                } label: {
                                    AnimalGridCell(animal: animal)
                                }
                            } //: LOOP
                        } //: GRID
                        .padding(10)
                    } // SCROLL VIEW
                } //: CONDITION
            } //: GROUP
            .listStyle(.inset)
            .navigationTitle("Africa")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItemGroup(placement: .topBarTrailing) {
                    HStack {
                        // LIST
                        Button {
                            isGridViewActive = false
                            haptics.impactOccurred()
                        } label: {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundStyle(isGridViewActive ? .white : .accent)
                        }

                        // GRID
                        Button {
                            isGridViewActive = true
                            haptics.impactOccurred()
                            gridSwitch()
                        } label: {
                            Image(systemName: toolbarIcon)
                                .font(.title2)
                                .foregroundStyle(isGridViewActive ? .accent : .white)
                        }
                    } //: HSTACK
                } //: ITEM GROUP
            } //: TOOLBAR
        } //: NAV STACK
    }
}

// MARK: - PREVIEW

#Preview {
    BrowseView()
}

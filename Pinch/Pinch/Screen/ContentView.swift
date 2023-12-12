//
//  ContentView.swift
//  Pinch
//
//  Created by Yunus Emre Berdibek on 1.10.2023.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES

    @State private var isAnimating: Bool = false
    @State private var imageScale: CGFloat = 1
    @State private var imageOffset: CGSize = .zero
    @State private var isDrawerOpen: Bool = false
    @State private var pageIndex: Int = 1

    let pages: [Page] = pagesData

    // MARK: - FUNCTIONS

    func resetImageState() {
        return withAnimation(.spring) {
            imageScale = 1
            imageOffset = .zero
        }
    }

    func currentPage() -> String {
        pages[pageIndex - 1].imageName
    }

    // MARK: - BODY

    var body: some View {
        NavigationStack {
            ZStack {
                Color.clear

                // MARK: - PAGE IMAGE

                Image(currentPage())
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(.rect(cornerRadius: 10))
                    .padding()
                    .shadow(color: .black.opacity(0.2),
                            radius: 10, x: 2, y: 2)
                    .opacity(isAnimating ? 1 : 0)
                    .offset(x: imageOffset.width, y: imageOffset.height)
                    .animation(.linear(duration: 1),
                               value: isAnimating)
                    .scaleEffect(imageScale)

                    // MARK: - 1. TAP GESTURE

                    .onTapGesture(count: 2, perform: {
                        if imageScale == 1 {
                            withAnimation(.spring) {
                                imageScale = 5
                            }
                        } else {
                            resetImageState()
                        }
                    })

                    // MARK: - 2. DRAG GESTURE

                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                withAnimation(.linear(duration: 1)) {
                                    imageOffset = value.translation
                                }
                            }
                            .onEnded { _ in
                                if imageScale <= 1 {
                                    resetImageState()
                                }
                            }
                    )

                    // MARK: 3. MAGNIFICATION

                    .gesture(
                        MagnificationGesture()
                            .onChanged { value in
                                withAnimation(.linear(duration: 1)) {
                                    if imageScale >= 1, imageScale <= 5 {
                                        imageScale = value
                                    } else if imageScale > 5 {
                                        imageScale = 5
                                    }
                                }
                            }

                            .onEnded { _ in
                                if imageScale > 5 {
                                    imageScale = 5
                                } else if imageScale <= 1 {
                                    resetImageState()
                                }
                            }
                    )
            } //: ZSTACK
            .navigationTitle("Pinch & Zoom")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear(perform: {
                withAnimation(.linear(duration: 1)) {
                    isAnimating = true
                }
            })

            // MARK: - INFO PANEL

            .overlay(
                InfoPanelView(scale: imageScale, offset: imageOffset)
                    .padding(.horizontal)
                    .padding(.top, 30),
                alignment: .top
            )

            // MARK: CONTROLS

            .overlay(
                Group {
                    HStack {
                        // SCALE DOWN
                        Button {
                            withAnimation(.spring) {
                                if imageScale > 1 {
                                    imageScale -= 1
                                }

                                if imageScale <= 1 {
                                    resetImageState()
                                }
                            }
                        }
                        label: {
                            ControlImageView(icon: "minus.magnifyingglass")
                        }
                        // RESET
                        Button {
                            resetImageState()
                        }
                        label: {
                            ControlImageView(icon: "arrow.up.left.and.down.right.magnifyingglass")
                        }
                        // SCALE UP
                        Button {
                            withAnimation(.spring()) {
                                if imageScale < 5 {
                                    imageScale += 1
                                }

                                if imageScale > 5 {
                                    imageScale = 5
                                }
                            }
                        }
                        label: {
                            ControlImageView(icon: "plus.magnifyingglass")
                        }
                    } //: CONTROLS
                    .padding(EdgeInsets(top: 12, leading: 20, bottom: 12, trailing: 20))
                    .background(.ultraThinMaterial)
                    .clipShape(.rect(cornerRadius: 10))
                    .opacity(isAnimating ? 1 : 0)
                }
                .padding(.bottom, 30),
                alignment: .bottom
            )

            // MARK: - DRAVER

            .overlay(
                HStack(spacing: 12) {
                    // MARK: - DRAW HANDLE

                    Image(systemName: isDrawerOpen ?
                        "chevron.compact.right" :
                        "chevron.compact.left")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 40)
                        .padding(8)
                        .foregroundStyle(.secondary)
                        .onTapGesture {
                            withAnimation(.easeOut) {
                                isDrawerOpen.toggle()
                            }
                        }

                    // MARK: - THUMBNAILS

                    ForEach(pages) { item in
                        Image(item.thumbnailName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80)
                            .clipShape(.rect(cornerRadius: 8))
                            .shadow(radius: 4)
                            .opacity(isDrawerOpen ? 1 : 0)
                            .animation(.easeOut(duration: 0.5), value: isDrawerOpen)
                            .onTapGesture {
                                isAnimating = true
                                pageIndex = item.id
                            }
                    }

                    Spacer()
                } //: Draver
                .padding(EdgeInsets(top: 16, leading: 8, bottom: 16, trailing: 8))
                .background(.ultraThinMaterial)
                .clipShape(.rect(cornerRadius: 12))
                .opacity(isAnimating ? 1 : 0)
                .frame(width: 256)
                .padding(.top, UIScreen.main.bounds.height / 12)
                .offset(x: isDrawerOpen ? 20 : 215),
                alignment: .topTrailing
            )
        } //: NAVIGATION VIEW
    }
}

#Preview {
    ContentView()
}

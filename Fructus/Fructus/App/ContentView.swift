//
//  ContentView.swift
//  Fructus
//
//  Created by Yunus Emre Berdibek on 3.10.2023.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES

    var fruits: [Fruit] = fruitsData
    @State private var isShowingSettings = false

    // MARK: - BODY

    var body: some View {
        NavigationStack {
            List {
                ForEach(fruits.shuffled()) { fruit in
                    NavigationLink {
                        FruitDetailView(fruit: fruit)
                    } label: {
                        FruitRowView(fruit: fruit)
                            .padding(.vertical, 4)
                    }
                }
            } //: LİST
            .navigationTitle("Fruits")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        isShowingSettings = true
                    } label: {
                        Image(systemName: "slider.horizontal.3")
                    }
                    .sheet(isPresented: $isShowingSettings) {
                        SettingsView()
                    }
                }
            }
        } //: NAVSTACK
    }
}

// MARK: - PREVIEW

#Preview {
    ContentView(fruits: fruitsData)
}

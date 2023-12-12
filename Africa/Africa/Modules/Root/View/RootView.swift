//
//  RootView.swift
//  Africa
//
//  Created by Yunus Emre Berdibek on 5.10.2023.
//

import SwiftUI

struct RootView: View {
    var body: some View {
        TabView {
            ForEach(TabModel.tabItems) { item in
                item.page.tabItem {
                    Image(systemName: item.tabItem.image)
                    Text(item.tabItem.title)
                }
            }
        } //: TABVIEW
    }
}

#Preview {
    RootView()
}

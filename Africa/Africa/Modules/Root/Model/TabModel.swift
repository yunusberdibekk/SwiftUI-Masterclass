//
//  TabModel.swift
//  Africa
//
//  Created by Yunus Emre Berdibek on 5.10.2023.
//

import Foundation
import SwiftUI

struct TabModel: Identifiable {
    let id: String = NSUUID().uuidString
    let tabItem: TabItem
    let page: AnyView

    static let tabItems: [TabModel] =
        [
            .init(tabItem: TabItem(title: "Browse", image: "square.grid.2x2"), page: AnyView(BrowseView())),
            .init(tabItem: TabItem(title: "Watch", image: "play.rectangle"), page: AnyView(WatchView())),
            .init(tabItem: TabItem(title: "Locations", image: "map"), page: AnyView(LocationsView())),
            .init(tabItem: TabItem(title: "Gallery", image: "photo"), page: AnyView(GalleryView())),
        ]
}

struct TabItem {
    let title: String
    let image: String
}

//
//  DevoteApp.swift
//  Devote
//
//  Created by Yunus Emre Berdibek on 9.10.2023.
//

import SwiftUI

@main
struct DevoteApp: App {
    @AppStorage("isDarkMode") var isDarkMode: Bool = false
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            HomeView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }
}

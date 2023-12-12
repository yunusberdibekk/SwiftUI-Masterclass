//
//  SettingsRowView.swift
//  Fructus
//
//  Created by Yunus Emre Berdibek on 4.10.2023.
//

import SwiftUI

struct SettingsRowView: View {
    // MARK: - PROPERTIES

    let name: String
    var content: String? = nil
    var linkLabel: String? = nil
    var linkDestination: String? = nil

    // MARK: - BODY

    var body: some View {
        VStack {
            Divider().padding(.vertical, 4)
            HStack {
                Text(name)
                    .foregroundStyle(.gray)
                Spacer()
                if content != nil {
                    Text(content!)
                } else if linkLabel != nil && linkDestination != nil {
                    Link(linkLabel!, destination: URL(string: "https://\(linkDestination!)")!)
                    Image(systemName: "arrow.up.right.square")
                        .foregroundStyle(.pink)
                } else {
                    /*@START_MENU_TOKEN@*/EmptyView()/*@END_MENU_TOKEN@*/
                }
            }
        }
    }
}

// MARK: - PREVIEW

#Preview {
    SettingsRowView(name: "Yunus Emre", content: "Developer")
}

//
//  ListRowItemView.swift
//  Devote
//
//  Created by Yunus Emre Berdibek on 10.10.2023.
//

import SwiftUI

struct ListRowItemView: View {
    @Environment(\.managedObjectContext) var viewContext
    @ObservedObject var item: Item

    var body: some View {
        Toggle(isOn: $item.completion, label: {
            Text(item.task ?? "")
                .font(.system(.title2, design: .rounded))
                .fontWeight(.heavy)
                .foregroundStyle(item.completion ? .pink : .primary)
                .padding(.vertical)
        }) //: TOGGLE
        .toggleStyle(CheckboxStyle())
        .onReceive(item.objectWillChange, perform: { _ in
            try? self.viewContext.save()
        })
    }
}

// #Preview {
//    ListRowItemView()
// }

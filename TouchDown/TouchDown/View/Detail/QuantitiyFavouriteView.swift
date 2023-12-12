//
//  QuantitiyFavouriteView.swift
//  TouchDown
//
//  Created by Yunus Emre Berdibek on 8.10.2023.
//

import SwiftUI

struct QuantitiyFavouriteView: View {
    // MARK: - PROPERTIES

    @State private var counter: Int = 0

    // MARK: - BODY

    var body: some View {
        HStack(alignment: .center, spacing: 6, content: {
            Button(action: {
                if counter > 0 {
                    feedBack.impactOccurred()
                    counter -= 1
                }
            }, label: {
                Image(systemName: "minus.circle")
            }) //: BUTTON

            Text("\(counter)")
                .fontWeight(.semibold)
                .frame(minWidth: 36)

            Button(action: {
                if counter < 100 {
                    feedBack.impactOccurred()
                    counter += 1
                }
            }, label: {
                Image(systemName: "plus.circle")
            }) //: BUTTON

            Spacer()

            Button(action: {
                feedBack.impactOccurred()
            }, label: {
                Image(systemName: "heart.circle")
                    .foregroundStyle(.pink)
            }) //: BUTTON
        }) //: HSTACK
        .font(.system(.title, design: .rounded))
        .foregroundStyle(.black)
        .imageScale(.large)
    }
}

// MARK: - PREVIEW

#Preview {
    QuantitiyFavouriteView()
        .padding()
}

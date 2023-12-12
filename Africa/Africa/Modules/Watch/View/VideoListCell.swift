//
//  VideoListICell.swift
//  Africa
//
//  Created by Yunus Emre Berdibek on 6.10.2023.
//

import SwiftUI

struct VideoListCell: View {
    // MARK: - PROPERTIES

    let video: Video

    // MARK: - BODY

    var body: some View {
        HStack(spacing: 10) {
            ZStack {
                Image(video.thumbnail)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 80)
                    .clipShape(.rect(cornerRadius: 8))

                Image(systemName: "play.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 32)
                    .shadow(radius: 4)
            } //: ZSTACK

            VStack(alignment: .leading, spacing: 10) {
                Text(video.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundStyle(.accent)

                Text(video.headline)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
            } //: VSTACK
        } //: HSTACK
    }
}

// MARK: PREVIEW

#Preview {
    VideoListCell(video: Video.videos[0])
}

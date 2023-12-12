//
//  VideoPlayerView.swift
//  Africa
//
//  Created by Yunus Emre Berdibek on 6.10.2023.
//

import AVKit
import SwiftUI

struct VideoPlayerView: View {
    // MARK: - PROPERTIES

    let videoSelected: String
    let videoTitle: String

    // MARK: - BODY

    var body: some View {
        if let player = playVideo(fileName: videoSelected, fileFormat: "mp4") {
            VStack {
                VideoPlayer(player: player)
            } //: VSTACK
            .overlay(
                Image(.logo)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
                    .padding(.top, 6)
                    .padding(.horizontal, 8),
                alignment: .topLeading
            )
            .tint(.accentColor)
            .navigationTitle(videoTitle)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

// MARK: PREVIEW

#Preview {
    NavigationStack {
        VideoPlayerView(videoSelected: "lion", videoTitle: "Lion")
    }
}

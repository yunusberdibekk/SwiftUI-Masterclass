//
//  WatchView.swift
//  Africa
//
//  Created by Yunus Emre Berdibek on 5.10.2023.
//

import SwiftUI

struct WatchView: View {
    // MARK: - PROPERTIES

    @State var videos: [Video] = Bundle.main.decode("videos.json")
    let hapticImpact = UIImpactFeedbackGenerator(style: .medium)

    // MARK: - BODY

    var body: some View {
        NavigationStack {
            List {
                ForEach(videos) { video in
                    NavigationLink {
                        VideoPlayerView(videoSelected: video.id, videoTitle: video.name)
                    } label: {
                        VideoListCell(video: video)
                            .padding(.vertical, 8)
                    }
                }
            } //: LIST
            .listStyle(.insetGrouped)
            .navigationTitle("Videos")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        videos.shuffle()
                        hapticImpact.impactOccurred()
                    } label: {
                        Image(systemName: "arrow.2.squarepath")
                    }
                }
            }
        } //: NAV STACK
    }
}

// MARK: - PREVIEW

#Preview {
    WatchView()
}

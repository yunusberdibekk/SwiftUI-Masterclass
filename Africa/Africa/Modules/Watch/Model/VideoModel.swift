//
//  VideoModel.swift
//  Africa
//
//  Created by Yunus Emre Berdibek on 6.10.2023.
//

import Foundation

struct Video: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String

    // Computed property
    var thumbnail: String {
        "video-\(id)"
    }
}

extension Video {
    static let videos: [Video] = Bundle.main.decode("videos.json")
}

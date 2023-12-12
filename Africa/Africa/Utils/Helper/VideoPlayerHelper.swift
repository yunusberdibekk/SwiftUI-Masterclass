//
//  VideoPlayerHelper.swift
//  Africa
//
//  Created by Yunus Emre Berdibek on 6.10.2023.
//

import AVKit
import Foundation

var videoPlayer: AVPlayer?

func playVideo(fileName: String, fileFormat: String) -> AVPlayer? {
    if Bundle.main.url(forResource: fileName, withExtension: fileFormat) != nil {
        videoPlayer = AVPlayer(url: Bundle.main.url(forResource: fileName, withExtension: fileFormat)!)
        videoPlayer?.play()
    }

    return videoPlayer
}

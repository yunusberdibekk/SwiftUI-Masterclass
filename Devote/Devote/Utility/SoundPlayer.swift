//
//  SoundPlayer.swift
//  Devote
//
//  Created by Yunus Emre Berdibek on 10.10.2023.
//

import AVFoundation
import Foundation

var audioPlayer: AVAudioPlayer?

func play(sound: String, type: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        } catch {
            print("Could not find and play the sound file.")
        }
    }
}

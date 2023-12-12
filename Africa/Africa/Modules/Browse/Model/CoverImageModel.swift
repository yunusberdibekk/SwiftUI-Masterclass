//
//  CoverImageModel.swift
//  Africa
//
//  Created by Yunus Emre Berdibek on 5.10.2023.
//

import Foundation

struct CoverImage: Codable, Identifiable {
    let id: Int
    let name: String
}

extension CoverImage {
    static let coverImages: [CoverImage] = Bundle.main.decode("covers.json")
}

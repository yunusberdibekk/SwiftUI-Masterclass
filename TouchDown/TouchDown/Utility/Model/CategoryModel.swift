//
//  CategoryModel.swift
//  TouchDown
//
//  Created by Yunus Emre Berdibek on 8.10.2023.
//

import Foundation

struct Category: Codable, Identifiable {
    let id: Int
    let name: String
    let image: String
}

//
//  AnimalModel.swift
//  Africa
//
//  Created by Yunus Emre Berdibek on 5.10.2023.
//

import Foundation

struct Animal: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    let description: String
    let link: String
    let image: String
    let gallery: [String]
    let fact: [String]
}

extension Animal {
    static let animals: [Animal] = Bundle.main.decode("animals.json")
}

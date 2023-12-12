//
//  Bundle + Extension.swift
//  TouchDown
//
//  Created by Yunus Emre Berdibek on 8.10.2023.
//

import Foundation

extension Bundle {
    func decode<T: Codable>(_ file: String) -> T {
        guard let url = url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle")
        }

        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to data \(file) from bundle")
        }

        let decoder = JSONDecoder()

        guard let decodedData = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle")
        }

        return decodedData
    }
}
